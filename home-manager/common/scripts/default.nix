{ pkgs, ... }:
let
  script_env = pkgs.buildEnv {
    name = "my-scripts";
    paths = [
      ./.
    ];
  };
in
{
  home.packages = [ script_env ];
}
