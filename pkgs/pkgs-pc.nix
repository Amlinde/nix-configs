{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    legendary-gl
  ];
  programs.steam.enable = true;
}
