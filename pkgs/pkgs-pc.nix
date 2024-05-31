{ pkgs, ... }:
let
  foundryvtt = pkgs.callPackage ./foundryvtt { };
  prismlauncher = pkgs.prismlauncher.override { jdks = with pkgs; [ temurin-bin-8 temurin-bin-17 temurin-bin-21 ]; };
in
{
  environment.systemPackages = with pkgs; [
    legendary-gl
    ckb-next
    mangohud
    gamescope
    foundryvtt
    prismlauncher
  ];

  programs.gamemode.enable = true;
  nixpkgs.config.packageOverrides = pkgs: {
    steam = pkgs.steam.override {
      extraPkgs = pkgs: with pkgs; [
        xorg.libXcursor
        xorg.libXi
        xorg.libXinerama
        xorg.libXScrnSaver
        libpng
        libpulseaudio
        libvorbis
        stdenv.cc.cc.lib
        libkrb5
        keyutils
      ];
    };
  };
  programs.steam.enable = true;
  virtualisation.waydroid.enable = true;
}
