{ extraConfig, home, pkgs, ... }:
{
  fonts.fontconfig.enable = true;

  home.packages = with pkgs; [
    font-awesome
    material-symbols

    jost
    roboto

    maple-mono
    maple-mono-NF
    (nerdfonts.override {
      fonts = [
        "JetBrainsMono"
        "NerdFontsSymbolsOnly"
      ];
    })
  ];
}

