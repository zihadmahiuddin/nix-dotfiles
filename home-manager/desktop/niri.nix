{ config, inputs, lib, pkgs, ... }:
{
  imports = [
    inputs.niri.homeModules.niri
  ];

  programs.niri.settings = {
    input.mouse.accel-profile = "flat";
    prefer-no-csd = true;
    clipboard.disable-primary = true;
    screenshot-path = "~/Pictures/Screenshots/Screenshot from %Y-%m-%d %H-%M-%S.png";
    xwayland-satellite.path = "${lib.getExe pkgs.xwayland-satellite}";

    cursor = {
      size = 24;
      theme = "";
    };

    outputs = {
      "DP-1" = {
        focus-at-startup = true;
        variable-refresh-rate = true;
        mode = {
          height = 1080;
          width = 1920;
          refresh = 200.00;
        };
        position = {
          x = 1920;
          y = 0;
        };
      };
      "HDMI-A-1" = {
        mode = {
          height = 1080;
          width = 1920;
          refresh = 60.00;
        };
        position = {
          x = 0;
          y = 0;
        };
      };
    };

    layout = {
      gaps = 12;
      shadow.enable = true;
      center-focused-column = "never";

      preset-column-widths = [
        { proportion = 1.0 / 3.0; }
        { proportion = 1.0 / 2.0; }
        { proportion = 2.0 / 3.0; }
      ];

      default-column-width = {
        proportion = 1.0;
      };

      focus-ring = {
        width = 2;
        active.gradient = {
          from = "#80c8ff";
          to = "#bbddff";
          angle = 45;
        };
        inactive.gradient = {
          from = "#80c8ff";
          to = "#bbddff";
          angle = 45;
        };
      };
    };

    environment = {
      QT_QPA_PLATFORM = "wayland";
      # why kde? see https://github.com/AvengeMedia/DankMaterialShell/issues/1289#issuecomment-3719556262
      QT_QPA_PLATFORMTHEME = "kde";
      QT_QPA_PLATFORMTHEME_QT6 = "kde";
      QT_STYLE_OVERRIDE = null;
    };

    # workspaces."terminal" = {};
    # workspaces."web" = {};
    # workspaces."code" = {};
    # workspaces."social" = {};
    # workspaces."media" = {};
    # workspaces."scratchpad" = {};

    window-rules = [
      {
        geometry-corner-radius =
        let
          r = 8.0;
        in
        {
          top-left = r;
          top-right = r;
          bottom-left = r;
          bottom-right = r;
        };
        clip-to-geometry = true;
      }
      {
        matches = [
          {
            is-window-cast-target = true;
          }
        ];

        focus-ring = {
          active.color = "#f38ba8";
          inactive.color = "#7d0d2d";
        };

        border = {
          inactive.color = "#7d0d2d";
        };

        shadow = {
          color = "#7d0d2d70";
        };

        tab-indicator = {
          active.color = "#f38ba8";
          inactive.color = "#7d0d2d";
        };
      }
      {
        matches = [
          {
            app-id = "^(Bitwarden|discord)$";
          }
        ];
        block-out-from = "screencast";
      }
      {
        matches = [
          {
            app-id = "^kitty(.*)$";
          }
        ];
        open-on-workspace = "1";
      }
      {
        matches = [
          {
            app-id = "^(Brave-browser|Google-chrome|google-chrome|zen)(.*)$";
          }
        ];
        open-on-workspace = "2";
      }
      {
        matches = [
          {
            app-id = "^(Code|code|jetbrains-*)(.*)$";
          }
        ];
        open-on-workspace = "3";
      }
      {
        matches = [
          {
            app-id = "^discord(.*)$";
          }
        ];
        open-on-workspace = "4";
      }
      {
        matches = [
          {
            app-id = "^(mpv|Viewnior)(.*)$";
          }
        ];
        open-on-workspace = "5";
      }
      {
        matches = [
          {
            app-id = "^(csgo_linux64|osu!|Minecraft)(.*)$";
          }
        ];
        open-on-workspace = "6";
        open-fullscreen = true;
      }
      {
        matches = [
          {
            app-id = "^(PrismLauncher|Spotify)(.*)$";
          }
        ];
        open-on-workspace = "7";
      }
      {
        matches = [
          {
            app-id = "^(mpv|Bitwarden|float-|com.github.hluk.copyq)(.*)$";
          }
        ];
        open-floating = true;
      }
      {
        matches = [
          {
            app-id = "osu.Game.Tests";
            title = "^osu! \(development\)$";
          }
        ];
        open-on-workspace = "3";
        open-maximized = false;
        open-fullscreen = false;
        open-floating = false;
        default-column-width = {
          proportion = 1.0 / 2.0;
        };
      }
    ];

    binds = with config.lib.niri.actions; {
      "Mod+Shift+Slash".action = show-hotkey-overlay;

      "Mod+Return" = {
        hotkey-overlay.title = "Open Terminal";
        action = spawn "kitty";
      };
      "Mod+Shift+Return" = {
        hotkey-overlay.title = "Open Floating Terminal";
        action = spawn "kitty" "--class" "float-kitty";
      };
      "Mod+D" = {
        hotkey-overlay.title = "Open App Launcher";
        action = spawn "rofi" "-show" "drun"; # TODO: change
      };
      "Mod+Alt+L" = {
        hotkey-overlay.title = "Lock Screen";
        action = spawn "rofi" "-show" "drun"; # TODO: change
      };

      "XF86AudioRaiseVolume" = {
        allow-when-locked = true;
        action = spawn "wpctl" "set-volume" "@DEFAULT_AUDIO_SINK@" "0.1+";
      };
      "XF86AudioLowerVolume" = {
        allow-when-locked = true;
        action = spawn "wpctl" "set-volume" "@DEFAULT_AUDIO_SINK@" "0.1-";
      };
      "XF86AudioMute" = {
        allow-when-locked = true;
        action = spawn "wpctl" "set-mute" "@DEFAULT_AUDIO_SINK@" "toggle";
      };
      "XF86AudioMicMute" = {
        allow-when-locked = true;
        action = spawn "wpctl" "set-mute" "@DEFAULT_AUDIO_SOURCE@" "toggle";
      };

      "Mod+Q".action = close-window;

      "Mod+H".action = focus-column-or-monitor-left;
      "Mod+J".action = focus-window-or-workspace-down;
      "Mod+K".action = focus-window-or-workspace-up;
      "Mod+L".action = focus-column-or-monitor-right;

      "Mod+Shift+H".action = focus-monitor-left;
      "Mod+Shift+L".action = focus-monitor-right;

      "Mod+Ctrl+H".action = move-column-left-or-to-monitor-left;
      "Mod+Ctrl+J".action = move-window-down-or-to-workspace-down;
      "Mod+Ctrl+K".action = move-window-up-or-to-workspace-up;
      "Mod+Ctrl+L".action = move-column-right-or-to-monitor-right;

      "Mod+Home".action = focus-column-first;
      "Mod+End".action = focus-column-last;
      "Mod+Ctrl+Home".action = move-column-to-first;
      "Mod+Ctrl+End".action = move-column-to-last;

      "Mod+I".action = focus-workspace-down;
      "Mod+U".action = focus-workspace-up;
      "Mod+Ctrl+I".action = move-column-to-workspace-down;
      "Mod+Ctrl+U".action = move-column-to-workspace-up;

      # Alternatively, there are commands to move just a single window:
      # Mod+Ctrl+Page_Down { move-window-to-workspace-down; }
      # ...

      "Mod+Shift+I".action = move-workspace-down;
      "Mod+Shift+U".action = move-workspace-up;

      # You can bind mouse wheel scroll ticks using the following syntax.
      # These binds will change direction based on the natural-scroll setting.
      #
      # To avoid scrolling through workspaces really fast, you can use
      # the cooldown-ms property. The bind will be rate-limited to this value.
      # You can set a cooldown on any bind, but it's most useful for the wheel.
      "Mod+WheelScrollDown" = {
        cooldown-ms = 150;
        action = focus-workspace-down;
      };
      "Mod+WheelScrollUp" = {
        cooldown-ms = 150;
        action = focus-workspace-up;
      };
      "Mod+Ctrl+WheelScrollDown" = {
        cooldown-ms = 150;
        action = move-column-to-workspace-down;
      };
      "Mod+Ctrl+WheelScrollUp" = {
        cooldown-ms = 150;
        action = move-column-to-workspace-up;
      };

      "Mod+WheelScrollRight".action = focus-column-right;
      "Mod+WheelScrollLeft".action = focus-column-left;
      "Mod+Ctrl+WheelScrollRight".action = move-column-right;
      "Mod+Ctrl+WheelScrollLeft".action = move-column-left;

      # Usually scrolling up and down with Shift in applications results in
      # horizontal scrolling; these binds replicate that.
      "Mod+Shift+WheelScrollDown".action = focus-column-right;
      "Mod+Shift+WheelScrollUp".action = focus-column-left;
      "Mod+Ctrl+Shift+WheelScrollDown".action = move-column-right;
      "Mod+Ctrl+Shift+WheelScrollUp".action = move-column-left;

      "Mod+1".action = focus-workspace 1;
      "Mod+2".action = focus-workspace 2;
      "Mod+3".action = focus-workspace 3;
      "Mod+4".action = focus-workspace 4;
      "Mod+5".action = focus-workspace 5;
      "Mod+6".action = focus-workspace 6;
      "Mod+7".action = focus-workspace 7;
      "Mod+8".action = focus-workspace 8;
      "Mod+9".action = focus-workspace 9;
      "Mod+0".action = focus-workspace 10;

      # "Mod+Shift+1".action = move-column-to-workspace "terminal";
      # "Mod+Shift+2".action = move-column-to-workspace "web";
      # "Mod+Shift+3".action = move-column-to-workspace "code";
      # "Mod+Shift+4".action = move-column-to-workspace "social";
      # "Mod+Shift+5".action = move-column-to-workspace "media";
      # "Mod+Shift+6".action = move-column-to-workspace "scratchpad";
      # "Mod+Shift+7".action = move-column-to-workspace 7;
      # "Mod+Shift+8".action = move-column-to-workspace 8;
      # "Mod+Shift+9".action = move-column-to-workspace 9;
      # "Mod+Shift+0".action = move-column-to-workspace 10;

      # Switches focus between the current and the previous workspace.
      "Alt+Tab".action = focus-workspace-previous;

      "Mod+Tab".action = spawn "bash" "-c" "~/.config/waybar/scripts/niri/scroll-workspace.py next";
      "Mod+Shift+Tab".action = spawn "bash" "-c" "~/.config/waybar/scripts/niri/scroll-workspace.py prev";

      # Toggle normal and tabbed display
      "Mod+T".action = toggle-column-tabbed-display;

      # The following binds move the focused window in and out of a column.
      # If the window is alone, they will consume it into the nearby column to the side.
      # If the window is already in a column, they will expel it out.
      "Mod+BracketLeft".action = consume-or-expel-window-left;
      "Mod+BracketRight".action = consume-or-expel-window-right;

      # Consume one window from the right to the bottom of the focused column.
      "Mod+Comma".action = consume-window-into-column;
      # Expel the bottom window from the focused column to the right.
      "Mod+Period".action = expel-window-from-column;

      "Mod+R".action = switch-preset-column-width;
      "Mod+Shift+R".action = switch-preset-window-height;
      "Mod+Ctrl+R".action = reset-window-height;

      "Mod+Shift+F".action = maximize-column;
      "Mod+F".action = fullscreen-window;
      "Mod+C".action = center-column;

      # Finer width adjustments.
      # This command can also:
      # * set width in pixels: "1000"
      # * adjust width in pixels: "-5" or "+5"
      # * set width as a percentage of screen width: "25%"
      # * adjust width as a percentage of screen width: "-10%" or "+10%"
      # Pixel sizes use logical, or scaled, pixels. I.e. on an output with scale 2.0,
      # set-column-width "100" will make the column occupy 200 physical screen pixels.
      "Mod+Minus".action = set-column-width "-10%";
      "Mod+Equal".action = set-column-width "+10%";

      # Finer height adjustments when in column with other windows.
      "Mod+Shift+Minus".action = set-window-height "-10%";
      "Mod+Shift+Equal".action = set-window-height "+10%";

      # Move the focused window between the floating and the tiling layout.
      "Mod+Space".action = toggle-window-floating;
      "Mod+Shift+Space".action = switch-focus-between-floating-and-tiling;

      # Looks like niri-flake does not have these options defined.
      # This is a workaround for now (https://github.com/sodiboo/niri-flake/issues/922#issuecomment-2729519779)
      "Print".action.screenshot = [];
      "Ctrl+Print".action.screenshot-screen = [];
      "Alt+Print".action.screenshot-window = [];

      "Mod+Ctrl+Shift+Q".action = quit;

      # Powers off the monitors. To turn them back on, do any input like
      # moving the mouse or pressing any other key.
      "Mod+Shift+P".action = power-off-monitors;

      "Mod+O".action = open-overview;
    };
  };
}
