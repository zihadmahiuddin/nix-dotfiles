{ extraConfig, pkgs, ... }:
{
  gtk = {
    enable = true;

    font = {
      name = extraConfig.fontFamily;
    };

    iconTheme = {
      name = "Papirus-Dark";
      package = pkgs.catppuccin-papirus-folders;
    };
  };
}
