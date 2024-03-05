{ pkgs, ... }:
{
  environment.systemPackages = [
    legendary-gl
  ];
  programs.steam.enable = true;
}
