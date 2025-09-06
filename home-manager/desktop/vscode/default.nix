{ pkgs, ... }:
let
  extraExtensions = pkgs.vscode-utils.extensionsFromVscodeMarketplace [
    {
      name = "catppuccin-vsc-icons";
      publisher = "catppuccin";
      version = "0.10.0";
      sha256 = "ikDF2BL4/+JVo74iOrokJ188kYHxLKzqeAM6J75FjOE=";
    }
  ];
in
{
  programs.vscode = {
    enable = true;
    profiles.default.extensions = with pkgs.vscode-extensions; [
      zhuangtongfa.material-theme
      catppuccin.catppuccin-vsc
      rust-lang.rust-analyzer
      wakatime.vscode-wakatime
      vscodevim.vim
    ] ++ extraExtensions;
  };
}

