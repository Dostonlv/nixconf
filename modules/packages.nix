{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    git
    bat
    vim
    meow
    htop
    tree
    btop
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
