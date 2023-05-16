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

    theme = {
      name = "Catppuccin-Mocha-Standard-Blue-Dark";
      package = pkgs.catppuccin-gtk.override {
        variant = "mocha";
      };
    };
  };
}
