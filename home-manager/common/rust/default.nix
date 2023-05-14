{ pkgs, ... }:
{
  home.sessionVariables = {
    CARGO_REGISTRIES_CRATES_IO_PROTOCOL = "sparse";
  };

  home.packages = with pkgs; [
    rustup
  ];
}
