{ pkgs, ... }:
{
  home.packages = with pkgs; [
    jetbrains.idea-community
    jdk21

    jetbrains.rider
    dotnet-sdk_6
  ];
}
