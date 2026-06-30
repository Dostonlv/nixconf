{ inputs, pkgs, ... }:
{

  programs.vicinae = {
    enable = true;
    systemd = {
      enable = true;
      autoStart = true;
    };

    settings = {
      close_on_focus_loss = true;
      consider_preedit = true;
      pop_to_root_on_close = true;
      favicon_service = "twenty";
      search_files_in_root = true;
      font.normal = {
        size = 12;
        family = "JetBrainsMono Nerd Font";
      };
      launcher_window.opacity = 0.98;
    };
  };
}
