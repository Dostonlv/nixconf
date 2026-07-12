{ inputs, pkgs, ... }:
{
  #  for vicinae working
  programs.gnome-shell = {
    enable = true;

    extensions = [
      { package = pkgs.gnomeExtensions.vicinae; }
      { package = pkgs.gnomeExtensions.blur-my-shell; }
      { package = pkgs.gnomeExtensions.gnome-wallpaper-engine; }
    ];
  };
}
