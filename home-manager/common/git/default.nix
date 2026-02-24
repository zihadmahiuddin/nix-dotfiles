{ home, pkgs, ... }:
{
  programs.difftastic = {
    enable = true;
    git.enable = true;
    jujutsu.enable = true;
    options.color = "dark";
  };

  programs.git = {
    enable = true;

    userName = "Zihad";
    userEmail = "zihadmahiuddin@gmail.com";

    signing = {
      key = "8F89E26CA019D973";
      signByDefault = true;
    };

    aliases = {
      quickserve = "daemon --verbose --export-all --base-path=.git --reuseaddr --strict-paths .git/";
    };

    difftastic = {
      enable = true;
      background = "dark";
    };

    extraConfig = {
      init = {
        defaultBranch = "main";
      };
    };
  };

  programs.jujutsu = {
    enable = true;
    settings = {
      ui = {
        default-command = "log";
      };
      user = {
        email = "zihadmahiuddin@gmail.com";
        name = "Zihad";
      };
    };
  };
}
