{ inputs, pkgs, ... }:
{

  programs.vicinae = {
    enable = true;
    systemd = {
      enable = true;
      autoStart = true;
    };

    themes = {
      "tokyo-night" = {
        meta = {
          version = 1;
          name = "Tokyo Night";
          description = "A clean, dark theme celebrating Downtown Tokyo at night";
          variant = "dark";
          inherits = "vicinae-dark";
        };
        colors = {
          core = {
            background = "#1a1b26";
            foreground = "#c0caf5";
            secondary_background = "#16161e";
            border = "#313244";
            accent = "#7aa2f7";
          };
          accents = {
            blue = "#7aa2f7";
            green = "#9ece6a";
            magenta = "#bb9af7";
            orange = "#ff9e64";
            purple = "#9d7cd8";
            red = "#f7768e";
            yellow = "#e0af68";
            cyan = "#7dcfff";
          };
        };
      };
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
