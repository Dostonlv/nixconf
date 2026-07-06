{ inputs, pkgs, ... }:
{
  #  for vicinae working
  programs.gnome-shell = {
    enable = true;

    extensions = [
      { package = pkgs.gnomeExtensions.vicinae; }
    ];
  };
}
