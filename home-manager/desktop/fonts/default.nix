{ extraConfig, home, pkgs, ... }:
{
  fonts.fontconfig.enable = true;

  home.packages = with pkgs; [
    font-awesome
    material-symbols

    jost
    roboto

    noto-fonts-cjk-sans

    maple-mono.NF
    nerd-fonts.jetbrains-mono
    nerd-fonts.symbols-only
  ];
}

