{ home, pkgs, ... }:
let
  nvchad_package = pkgs.nvchad.override {
    custom = ./custom;
  };
in
{
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;
  };

  home.file = {
    ".config/nvim" = {
      source = nvchad_package;
      recursive = true;
    };
  };
}
