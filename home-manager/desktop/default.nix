{ inputs, outputs, system, lib, config, pkgs, ... }: {
  imports = [
    ./music-production
    ./caelestia
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
    ./gaming.nix
  ];

  home.packages = with pkgs; [
    brave
    bitwarden
    megasync
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
    youtube-music
  ];
}
