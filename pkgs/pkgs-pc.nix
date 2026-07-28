{ pkgs, inputs, ... }:
let
  foundryvtt = pkgs.callPackage ./foundryvtt { };
  lutris = pkgs.lutris.override { extraPkgs = pkgs: with pkgs; [ nwjs ]; };
  beammp_launcher = inputs.beammp_launcher.defaultPackage.x86_64-linux;
in
{
  environment.systemPackages = with pkgs; [
    legendary-gl
    mangohud
    gamescope
    qmk
#   foundryvtt
	shipwright
#	zelda64recomp
	dusklight
#	poptracker
    dolphin-emu
#    lact
    oversteer
#   beammp_launcher
    limo
    umu-launcher
    steamtinkerlaunch
  ];

  programs.gamemode.enable = true;
  nixpkgs.config.packageOverrides = pkgs: {
    steam = pkgs.steam.override {
      extraPkgs = pkgs: with pkgs; [
        libXcursor
        libXi
        libXinerama
        libXScrnSaver
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
    waydroid.enable = true;
  };

  services = {
    hardware.openrgb = { 
      enable = true; 
      package = pkgs.openrgb-with-all-plugins; 
      motherboard = "amd";  
    };

    sunshine = {
      enable = true;
      autoStart = false;
      capSysAdmin = true;
      openFirewall = true;	
    };
  };

#  systemd.packages = with pkgs; [ lact ];
#  systemd.services.lactd.wantedBy = ["multi-user.target"];
}
