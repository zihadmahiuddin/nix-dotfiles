{ lib, pkgs, ... }:
{
  programs.helix = {
    enable = true;

    settings = {
      theme = "catppuccin_mocha_transparent";
      editor = {
        cursor-shape = {
          normal = "block";
          insert = "bar";
          select = "underline";
        };
	line-number = "relative";
	bufferline = "multiple";
      };
      keys.normal = {
        esc = [ "collapse_selection" "keep_primary_selection" ];
      };
    };

    languages.language = [
      {
        name = "nix";
        auto-format = true;
        formatter.command = lib.getExe pkgs.nixfmt-rfc-style;
      }
      {
        name = "zig";
        auto-format = true;
      }
      {
        name = "rust";
        auto-format = true;
      }
    ];

    themes = {
      catppuccin_mocha_transparent = {
        "inherits" = "catppuccin_mocha";
        "ui.background" = { };
      };
    };
  };
}
