{ inputs, outputs, system, lib, config, pkgs, ... }: {
  imports = [
    ./cursor
    ./fonts
    ./i3
    ./kitty
    ./rofi
  ];

  home.packages = with pkgs; [
    firefox-devedition-bin
    vscode

    inputs.nix-gaming.packages.${system}.osu-stable
  ];
}
