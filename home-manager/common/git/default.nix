{ home, pkgs, ... }:
{
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
}
