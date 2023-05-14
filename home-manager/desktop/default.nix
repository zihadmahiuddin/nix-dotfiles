{ inputs, outputs, lib, config, pkgs, ... }: {
  imports = [
    ./cursor
    ./fonts
    ./i3
    ./kitty
  ];

  programs.neovim.enable = true;
  home.packages = with pkgs; [ lazygit ];
}
