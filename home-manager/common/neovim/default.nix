{ pkgs, ... }:
{
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = false;
    vimAlias = false;
    vimdiffAlias = true;

    extraPackages = with pkgs; [ rust-analyzer ];
  };
}
