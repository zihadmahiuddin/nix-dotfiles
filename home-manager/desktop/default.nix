{ inputs, outputs, lib, config, pkgs, ... }: {
  imports = [
    ./fonts
    ./i3
    ./kitty
  ];

  programs.neovim.enable = true;
  home.packages = with pkgs; [ lazygit ];
}
