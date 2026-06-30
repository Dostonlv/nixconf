{
  /*
       ___                 ___
      |__  |     /\  |__/ |__
      |    |___ /~~\ |  \ |___
  */

  description = "kisuke's flake configuration";

  nixConfig = {
    experimental-features = [
      "nix-command"
      "flakes"
    ];
  };

  inputs = {
    # Nixpkgs stable (Xantusia 26.05)
    # nixpkgs.url = "github:NixOS/nixpkgs/nixos-26.05";

    # Nixpkgs beta
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-26.05";

    # zen-browser.url = "github:youwen5/zen-browser-flake";
    # zen-browser.inputs.nixpkgs.follows = "nixpkgs";

    # Nixpkgs unstable for rolling release
    nixpkgs-unstable.url = "github:nixos/nixpkgs?ref=nixos-unstable";

    # For hardware specific modifications
    hardware.url = "github:nixos/nixos-hardware";

    # Home Manager
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    firefox-addons = {
      url = "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # vicinae.url = "github:vicinaehq/vicinae";

  };

  outputs =
    {
      self,
      nixpkgs,
      home-manager,
      ...
    }@inputs:
    let
      # Supported system (x86_64 architecture only)
      system = "x86_64-linux";

      tex = (
        pkgs.texliveBasic.withPackages (
          ps: with ps; [
            dvisvgm
            dvipng # for preview and export as html
            wrapfig
            amsmath
            ulem
            hyperref
            capt-of
            #(setq org-latex-compiler "lualatex")
            #(setq org-preview-latex-default-process 'dvisvgm)
          ]
        )
      );

      # allow_unfree packages
      pkgs = import nixpkgs {
        inherit system; # system = system;
        config.allowUnfree = true;
      };

      # Overlays
      overlays = import ./overlays/default.nix;
      pkgsWithOverlays = import pkgs {
        inherit system;
        overlays = [
          overlays

        ];
        config.allowUnfree = true;
      };
    in
    {
      nixosConfigurations.kisuke = nixpkgs.lib.nixosSystem {
        inherit system;
        modules = [
          ./nixos/configuration.nix
          ./nixos/hardware-configuration.nix
        ];

        specialArgs = {
          inherit self inputs pkgsWithOverlays;
        };
      };

      formatter.${system} = pkgs.nixfmt;

      home.packages = with pkgs; [
        tex
      ];

      # Home manager
      homeConfigurations.kisuke = home-manager.lib.homeManagerConfiguration {
        inherit system;
        username = "kisuke";
        homeDirectory = "/home/kisuke";
        configuration = ./home.nix;

        pkgs = pkgsWithOverlays;
      };
    };
}
