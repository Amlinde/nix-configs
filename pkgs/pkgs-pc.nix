{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    legendary-gl
    ckb-next
    gamescope
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
}
