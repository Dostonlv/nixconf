{pkgs, ...}: {
  fonts = {
    enableDefaulPackages = true;
    packages = with pkgs; [
      mplus-outline-fonts.githubRelease
      noto-fonts-color-emoji
      noto-fonts-cjk-sans
      fira-code-symbols
      liberation_ttf
      fira-code
      proggyfonts
      noto-fonts
      dina-font

      inter-nerdfont
      dejavu_fonts
      ibm-plex
      hack-font
      raleway
      inter
      roboto
      #work-sans
      #comic-neue
      #source-sans
      #dejavu_fonts

      googlesans-code
      jetbrains-mono
      iosevka
      fira-sans
      #openmoji-color
      #twemoji-color-font
      #corefonts
      #vista-fonts
      #material-symbols
    ];

    fontconfig = {
      defaultFonts = {
        monospace = ["Liberation Sans"];
        sansSerif = ["Liberation Sans"];
        serif = ["Liberation Sans"];
        emoji = ["Liberation Sans"];
      };
    };
  };
}
