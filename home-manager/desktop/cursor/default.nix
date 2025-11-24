{ pkgs, ... }: {
  home.pointerCursor = {
    package = pkgs.catppuccin-cursors.mochaDark;
    name = "catppuccin-mocha-dark-cursors";
    x11.enable = true;
    gtk.enable = true;
  };
}
