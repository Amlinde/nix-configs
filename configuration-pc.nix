# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [
      ./configuration-generic.nix
      ./system/fs.nix
      ./pkgs/pkgs-pc.nix
    ];

  powerManagement.cpuFreqGovernor = "performance";
  boot.kernelPackages = pkgs.linuxPackages_zen;

  networking.hostName = "al-desktop-nixos"; # Define your hostname.
}
