{ pkgs, inputs, ... }:
let
  foundryvtt = pkgs.callPackage ./foundryvtt { };
  prismlauncher = pkgs.prismlauncher.override { jdks = with pkgs; [ temurin-bin-8 temurin-bin-17 temurin-bin-21 ]; };
  lutris = pkgs.lutris.override { extraPkgs = pkgs: with pkgs; [ nwjs ]; };
  beammp_launcher = inputs.beammp_launcher.defaultPackage.x86_64-linux;
in
{
  environment.systemPackages = with pkgs; [
    legendary-gl
    lutris
    ckb-next
    mangohud
    gamescope
#   foundryvtt
    prismlauncher
#	poptracker
    dolphin-emu
    lact
    oversteer
    beammp_launcher
    limo
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
  programs = {
    steam.enable = true;
    virt-manager.enable = true;
  };

  virtualisation = {
    libvirtd.enable = true;
#    waydroid.enable = true;
  };

  services.hardware.openrgb = { 
    enable = true; 
    package = pkgs.openrgb-with-all-plugins; 
    motherboard = "amd";  
  };

  systemd.packages = with pkgs; [ lact ];
  systemd.services.lactd.wantedBy = ["multi-user.target"];
}
