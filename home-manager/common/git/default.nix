{ home, pkgs, ... }:
{
  programs.difftastic = {
    enable = true;
    git.enable = true;
    jujutsu.enable = true;
  };

  programs.git = {
    enable = true;

    userName = "Zihad";
    userEmail = "zihadmahiuddin@gmail.com";

    signing = {
      key = "key::ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAILcVH8aHNDVPUADwzQWA5DYgLvpFUezy4eMWtOO8Oopi zihad@sora";
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
      blame = {
        coloring = "highlightRecent";
        date = "relative";
      };
      core.autocrlf = "input";
      diff = {
        context = 3;
        renames = "copies";
        interHunkContext = 10;
      };
      gpg.format = "ssh";
      init.defaultBranch = "main";
      log = {
        abbrevCommit = true;
      };
      pull.rebase = true;
      push = {
        autoSetupRemote = true;
        default = "current";
        followTags = true;
      };
      submodule.fetchJobs = 16;
      rebase.autoStash = true;
      url."git@github.com:".insteadOf = "gh:";
      url."https://github.com/".insteadOf = "gh/";
    };
  };

  programs.jujutsu = {
    enable = true;
    settings = {
      signing = {
        behavior = "own";
        backend = "ssh";
        key = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAILcVH8aHNDVPUADwzQWA5DYgLvpFUezy4eMWtOO8Oopi zihad@sora";
      };
      ui = {
        default-command = "log";
      };
      user = {
        email = "zihadmahiuddin@gmail.com";
        name = "Zihad";
      };
      working-copy.eol-conversion = "input";
    };
  };
}
