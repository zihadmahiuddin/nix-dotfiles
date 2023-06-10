{ pkgs, ... }:
{
  home.sessionVariables = {
    CARGO_REGISTRIES_CRATES_IO_PROTOCOL = "sparse";
    PATH = "$HOME/.cargo/bin/:$PATH";
  };

  home.packages = with pkgs; [
    rustup
  ];
}
