{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    legendary-gl
    ckb-next
    gamescope
    mangohud
  ];

  programs.gamemode.enable = true;
  programs.steam.enable = true;
}
