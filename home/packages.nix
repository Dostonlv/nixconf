{
  pkgs,
  ...
}: {
  home.packages = with pkgs; [
    gh
    lf
    bat
    dig
    vim
    vlc
    zip
    btop
    fish
    gimp
    nixd
    tree
    wget
    cargo
    exfat
    unzip
    clippy
    direnv
    gnutls
    lolcat
    netcat
    openssl
    spotify
    alejandra
    yandex-music
  ];

 imports = [
   ./programs/firefox
   ./programs/vscode
];
}
