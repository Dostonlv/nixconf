{
  pkgs,
  ...
}:
{
  home.packages = with pkgs; [
    ghostty
    wl-clipboard
    wl-clip-persist
  ];

  imports = [
    ./programs/firefox
    ./programs/vscode
    ./programs/dconf
    ./programs/vicinae
    ./programs/gnomeshell
  ];
}
