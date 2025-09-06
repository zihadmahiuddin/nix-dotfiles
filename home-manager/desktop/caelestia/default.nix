{ inputs, outputs, system, lib, config, pkgs, ... }:
{
  imports = [
    inputs.caelestia-shell.homeManagerModules.default
  ];

  programs.caelestia.enable = true;
  programs.caelestia.settings = {
    services = {
      useFahrenheit = false;
    };
  };
  programs.caelestia.cli.enable = true;

  home.file = {
    ".config/hypr" = {
      source = ./hypr;
      recursive = true;
    };
    ".config/fastfetch" = {
      source = ./fastfetch;
      recursive = true;
    };
    ".config/uwsm" = {
      source = ./uwsm;
      recursive = true;
    };
    ".config/btop" = {
      source = ./btop;
      recursive = true;
    };
  };

  home.packages = with pkgs; [
    adw-gtk3
    app2unit
    bluez
    btop
    cliphist
    curl
    fastfetch
    fish
    kitty
    hypridle
    hyprpicker
    imagemagick
    inotify-tools
    jq
    papirus-icon-theme
    libsForQt5.qt5ct
    kdePackages.qt6ct
    socat
    starship
    trash-cli
    nerd-fonts.jetbrains-mono
    material-symbols
    nerd-fonts.caskaydia-cove
    wireplumber
    wl-clipboard
    # optional
    gnome-keyring
    polkit_gnome
    spotify
    xfce.thunar
    todoist
  ];
}
