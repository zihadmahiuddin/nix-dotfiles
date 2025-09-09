{ inputs, outputs, system, lib, config, pkgs, ... }: {
  imports = [
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
    steam
    steam-run
    lutris
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
    niri

    inputs.nix-gaming.packages.${system}.osu-lazer-bin
    inputs.nix-gaming.packages.${system}.osu-stable
    winetricks
  ];
}
