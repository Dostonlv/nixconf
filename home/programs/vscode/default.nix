{ pkgs, lib, ... }:
{
  programs.vscode = {
    enable = true;
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

      ]
      ++ pkgs.vscode-utils.extensionsFromVscodeMarketplace [
        {
          name = "wit-idl";
          publisher = "BytecodeAlliance";
          version = "0.3.33";
          sha256 = "sha256-+zmf8wODLAI3zSHtzBFB4xTNPJkkvvOUPtkPxfLo7rI=";
        }
      ];
  };

}