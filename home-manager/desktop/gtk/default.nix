{ extraConfig, pkgs, ... }:
{
  gtk = {
    enable = false;

    font = {
      name = extraConfig.fontFamily;
    };

    iconTheme = {
      name = "Papirus-Dark";
      package = pkgs.catppuccin-papirus-folders;
    };
  };
}
