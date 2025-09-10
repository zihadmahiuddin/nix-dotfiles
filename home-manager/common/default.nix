{ inputs, outputs, lib, config, pkgs, ... }:
{
  imports = [
    ./git
    ./gpg
    ./neovim
    ./rust
    ./scripts
    ./tmux
    ./zsh
  ];

  home.packages = with pkgs; [
    nix-output-monitor # https://github.com/maralorn/nix-output-monitor
    nix-info
    git
    lazygit
    ripgrep
    unzip
    wakatime
    gcc
    file
    kubectl
  ];

  programs = {
    direnv = {
      enable = true;
      nix-direnv.enable = true;
    };

    starship.enable = true;

    zoxide.enable = true;
  };

  nixpkgs = {
    overlays = builtins.attrValues outputs.overlays;
    config = {
      allowUnfree = true;
      # Workaround for https://github.com/nix-community/home-manager/issues/2942
      allowUnfreePredicate = (_: true);
    };
  };

  home = {
    username = "zihad";
    homeDirectory = "/home/zihad";
  };

  programs.home-manager.enable = true;
  programs.git.enable = true;

  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  home.stateVersion = "22.11";
}

