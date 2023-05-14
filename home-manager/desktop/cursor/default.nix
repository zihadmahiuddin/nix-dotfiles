{ pkgs, ... }: {
  home.pointerCursor = {
    package = pkgs.catppuccin-cursors.mochaDark;
    name = "Catppuccin-Mocha-Dark-Cursors";
    x11.enable = true;
    gtk.enable = true;
  };
}

