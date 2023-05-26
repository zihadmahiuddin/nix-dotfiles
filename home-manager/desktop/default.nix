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
    ./vscode
  ];

  home.packages = with pkgs; [
    firefox-devedition-bin
    brave
    keepassxc
    megasync
    discord
    flameshot
    catppuccin-fcitx5
    steam
    obs-studio
    xclip

    inputs.nix-gaming.packages.${system}.osu-stable
  ];
}
