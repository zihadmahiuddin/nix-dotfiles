{ extraConfig, home, pkgs, ... }:
{
  fonts.fontconfig.enable = true;

  gtk.font = extraConfig.fontFamily;

  home.packages = with pkgs; [
    unstable.material-symbols

    jost
    roboto

    maple-mono-NF
    (nerdfonts.override {
      fonts = [
        "JetBrainsMono"
        "NerdFontsSymbolsOnly"
      ];
    })
  ];
}

