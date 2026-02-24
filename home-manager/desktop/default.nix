{ inputs, outputs, system, lib, config, pkgs, ... }: {
  imports = [
    ./dev
    ./music-production
    ./cursor
    ./fonts
    ./gtk
    ./i3
    ./irc
    ./kitty
    ./picom
    ./qt
    ./rofi
    ./vscode
    ./gnome-keyring-disable-ssh.nix
    ./gaming.nix
    ./dms.nix
    ./niri.nix
    ./mouseless.nix
  ];

  home.packages = with pkgs; [
    brave
    bitwarden-desktop
    (discord.override {
      withVencord = true;
    })
    discord-krisp-patcher
    flameshot
    catppuccin-fcitx5
    obs-studio
    xclip
    baobab
    mpv
    anydesk
    uget
    qbittorrent
    ngrok
    obsidian
    zed-editor
    sendme
    devenv
    dumbpipe
    pear-desktop
    krita
    parsec-bin
    android-tools
  ];
}
