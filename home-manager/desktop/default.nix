{ inputs, outputs, system, lib, config, pkgs, ... }: {
  imports = [
    ./cursor
    ./fonts
    ./gtk
    ./i3
    ./kitty
    ./picom
    ./qt
    ./rofi
  ];

  home.packages = with pkgs; [
    firefox-devedition-bin
    vscode
    brave
    keepassxc
    megasync
    discord
    xfce.thunar

    inputs.nix-gaming.packages.${system}.osu-stable
  ];
}
