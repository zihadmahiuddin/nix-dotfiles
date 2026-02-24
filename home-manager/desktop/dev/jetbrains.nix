{ pkgs, ... }:
{
  home.packages = with pkgs; [
    jetbrains.idea
    jdk21

    jetbrains.rider
    dotnet-sdk_6
  ];
}
