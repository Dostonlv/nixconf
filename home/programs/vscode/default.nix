{ pkgs, lib, ... }:
{
  programs.vscode = {
    enable = true;
    package = pkgs.unstable.vscode;
    extensions =
      with pkgs.vscode-extensions;
      [
        pkief.material-icon-theme
        bbenoist.nix
        eamodio.gitlens
        rust-lang.rust-analyzer
        mkhl.direnv
        shd101wyy.markdown-preview-enhanced
        tamasfe.even-better-toml
        jnoortheen.nix-ide
        pkief.material-icon-theme
      ]
      ++ pkgs.vscode-utils.extensionsFromVscodeMarketplace [
        {
          name = "wit-idl";
          publisher = "BytecodeAlliance";
          version = "0.3.33";
          sha256 = "sha256-+zmf8wODLAI3zSHtzBFB4xTNPJkkvvOUPtkPxfLo7rI=";
        }
      ];

    userSettings = {

      "[rust]" = {
        "editor.defaultFormatter" = "rust-lang.rust-analyzer";
        "editor.formatOnSave" = true;
      };

      "[nix]" = {
        "editor.defaultFormatter" = "jnoortheen.nix-ide";
        "editor.formatOnSave" = true;
      };

      "nix.formatterPath" = "nixfmt";
      "files.autoSave" = "afterDelay";
      "files.autoSaveDelay" = 0;
      "workbench.iconTheme"= "material-icon-theme";

    };
  };

}
