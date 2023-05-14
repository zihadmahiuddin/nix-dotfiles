{ inputs, outputs, lib, config, pkgs, ... }: {
  imports = [
    ./cursor
    ./fonts
    ./i3
    ./kitty
    ./rofi
  ];

  programs.neovim.enable = true;
  home.packages = with pkgs; [
    firefox-devedition-bin
    vscode
  ];
}
