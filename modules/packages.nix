{pkgs, ...}: {
    environment.systemPackages = with pkgs; [
      git
      bat
      vim
      meow
      htop
      tree
      btop
      fish
      curl
      nixd
      wget
      zeek
      kitty
      lazygit
      obsidian
      keycloak
      alejandra
      zed-editor
      font-alias
      nixpkgs-fmt
      rust-analyzer
    ];

    users.users.kisuke = {
      isNormalUser = true;
      shell = pkgs.fish;
      extraGroups = [
        "networkmanager"
        "wheel"
      ];
      packages = with pkgs; [
        vlc     
        audacity
        gns3-gui
        librewolf
      ];
    };
  }
