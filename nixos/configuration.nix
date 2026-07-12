# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).
#       _  _______  ______  ____    _________  _  _______________
#      / |/ /  _/ |/_/ __ \/ __/___/ ___/ __ \/ |/ / __/  _/ ___/
#     /    // /_>  </ /_/ /\ \/___/ /__/ /_/ /    / _/_/ // (_ /
#    /_/|_/___/_/|_|\____/___/    \___/\____/_/|_/_/ /___/\___/
#
{
  inputs,
  lib,
  pkgs,
  ...
}:
{
  imports = [
    inputs.home-manager.nixosModules.home-manager
    ./hardware-configuration.nix
    ../modules/packages.nix # INFO: environment & user packages
    ./parts/audio.nix
    ./parts/game.nix
    ./parts/pkt.nix
  ];

  # CVE-2026-31431
  boot.kernelPackages = lib.mkIf (lib.versionOlder pkgs.linux.version "6.18.22") (
    lib.mkDefault pkgs.linuxPackages_6_18
  );

  home-manager = {
    useGlobalPkgs = true;
    extraSpecialArgs = { inherit inputs; };
    backupFileExtension = "backup";
    users = {
      kisuke = import ../home.nix;
    };
  };

  programs = {
    nix-ld = {
      enable = true;
    };
  };

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "kisuke";

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  networking.networkmanager.enable = true;

  networking.hosts = {
    "91.212.89.25" = [ "git.oss.uzinfocom.uz" ];
  };

  time.timeZone = "Asia/Tashkent";
  i18n.defaultLocale = "en_US.UTF-8";
  console = {
    font = "Lat2-Terminus16";
    #keyMap = "us";
    useXkbConfig = true; # use xkb.options in tty.
  };

  # X11
  services.xserver.enable = true;
  services.xserver = {
    xkb.layout = "us";
    xkb.variant = "";
  };

  # Configure keymap in X11
  # services.xserver.xkb.layout = "us";
  # services.xserver.xkb.options = "eurosign:e,caps:escape";

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable the GNOME Desktop Environment.
  # services.xserver.displayManager.gdm.enable = true;
  services.displayManager.gdm.enable = true;
  # services.xserver.desktopManager.gnome.enable = true;
  services.desktopManager.gnome.enable = true;

  hardware.bluetooth.enable = true;
  hardware.bluetooth.powerOnBoot = true; # powers up the default Bluetooth controller on boot
  services.blueman.enable = true;

  programs.firefox.enable = true;
  programs.zsh = {
    enable = true;
    autosuggestions.enable = true;
    syntaxHighlighting.enable = true;
    ohMyZsh = {
      enable = true;
      theme = "robbyrussell";
      plugins = [
        "git"
        "history"
        "rust"
      ];
    };
    shellAliases = {
      reload = "sudo nixos-rebuild switch --flake ";
      garbage = "sudo nix-collect-garbage --delete-old";
      nihh = "code ~/nix";
      dev = "cd ~/Developer";
    };
  };

  services.tailscale.enable = true;

  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # services.openssh.enable = true;

  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # networking.firewall.enable = false;

  # https://nixos.org/manual/nixos/stable/options#opt-system.stateVersion .
  system.stateVersion = "26.05"; # Did you read the comment?
}
