{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    lf
    zip
    git
    bat
    vim
    mpv
    dig
    nixd
    wget
    meow
    htop
    tree
    btop
    curl
    nixd
    wget
    zeek
    bruno
    kitty
    unzip
    exfat
    cargo
    clippy
    lolcat
    netcat
    gnutls
    direnv
    ffmpeg
    spotify
    lazygit
    openssl
    cliphist
    obsidian
    keycloak
    alejandra
    alejandra
    zed-editor
    font-alias
    nixpkgs-fmt
    yandex-music
    rust-analyzer
    jetbrains.datagrip
    apache-directory-studio

    wpsoffice
    # rust
    rustc
    starship
    dotnet-sdk_10
    csharp-ls
    omnisharp-roslyn
  ];

  users.users.kisuke = {
    isNormalUser = true;
    shell = pkgs.zsh;
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
