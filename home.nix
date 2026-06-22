#                  .-'''-.
#                 '   _    \
#       .       /   /` '.   \  __  __   ___         __.....__
#     .'|      .   |     \  ' |  |/  `.'   `.   .-''         '.
#    <  |      |   '      |  '|   .-.  .-.   ' /     .-''"'-.  `.
#     | |      \    \     / / |  |  |  |  |  |/     /________\   \
#     | | .'''-.`.   ` ..' /  |  |  |  |  |  ||                  |
#     | |/.'''. \  '-...-'`   |  |  |  |  |  |\    .-------------'
#     |  /    | |             |  |  |  |  |  | \    '-.____...---.
#     | |     | |             |__|  |__|  |__|  `.             .'
#     | |     | |                                 `''-...... -'
#     | '.    | '.
#     '---'   '---'
{
  home.username = "kisuke";
  home.homeDirectory = "/home/kisuke";

  home.enableNixpkgsReleaseCheck = false;

  home.stateVersion = "26.05";
  nixpkgs.config.allowUnfree = true;

  imports = [
    ./home/packages.nix
    #./home/programs/kanata #TODO: fix the user group permissions
  ];

  home.file = { };

  programs.home-manager.enable = true;

  # Git
  programs.gh.enable = true;

  programs.git = {
    settings = {
      user = {
        name = "Kisuke";
        email = "kisuke@deltateam.uz";
      };
      init.defaultBranch = "main";
    };
  };
}
