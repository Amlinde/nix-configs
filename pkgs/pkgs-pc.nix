{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    legendary-gl
    ckb-next
  ];
  programs.steam.enable = true;
}
