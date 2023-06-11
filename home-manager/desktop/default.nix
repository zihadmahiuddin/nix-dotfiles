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
    ./gnome-keyring-disable-ssh.nix
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
    steam-run
    obs-studio
    xclip
    jetbrains.idea-community
    jdk11
    mongodb-compass
    postman
    baobab
    mpv
    teamviewer

    inputs.nix-gaming.packages.${system}.osu-lazer-bin
    inputs.nix-gaming.packages.${system}.osu-stable
    inputs.nix-gaming.packages.${system}.wine-osu
    winetricks

    inputs.frida-nix.packages.${system}.frida-python
    inputs.frida-nix.packages.${system}.frida-tools
  ];
}
