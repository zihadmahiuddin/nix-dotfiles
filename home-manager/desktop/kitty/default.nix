{ home, extraConfig, pkgs, ... }:
{
  programs.kitty = {
    enable = true;

    enableGitIntegration = true;
    shellIntegration.enableZshIntegration = true;

    extraConfig = ''
      include dank-tabs.conf
      include dank-theme.conf
    '';

    font = {
      name = extraConfig.fontFamily;
      size = 14;
    };

    keybindings = {
      "kitty_mod+t" = "new_tab_with_cwd";
    };

    settings = {
      editor = "nvim";

      enable_audio_bell = false;

      window_padding_width = "12 12 0 12";
      placement_strategy = "center";
      resize_in_steps = true;
      hide_window_decorations = "titlebar-only";
      background_opacity = "0.9";
      inactive_text_alpha = "1.0";
      enabled_layouts = "splits, stack";

      scrollback_lines = 1000000;

      tab_bar_min_tabs = 1;
      tab_bar_edge = "top";
      tab_bar_style = "powerline";

      tab_powerline_style = "slanted";
      tab_title_template = "{title}{' :{}:'.format(num_windows) if num_windows > 1 else ''}";

      active_tab_font_style = "bold";
      inactive_tab_font_style = "normal";

      adjust_column_width = 0;

      # nerd fonts
      symbol_map = "U+23FB-U+23FE,U+2665,U+26A1,U+2B58,U+E000-U+E00A,U+E0A0-U+E0A3,U+E0B0-U+E0C8,U+E0CA,U+E0CC-U+E0D2,U+E0D4,U+E200-U+E2A9,U+E300-U+E3E3,U+E5FA-U+E62F,U+E700-U+E7C5,U+F000-U+F2E0,U+F300-U+F31C,U+F400-U+F4A9,U+F500-U+F8FF ${extraConfig.symbolsFontFamily}";
    };
  };
}

