# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [
      ./system/hardware-configuration-laptop.nix
      ./configuration-generic.nix
      ./pkgs/pkgs-laptop.nix
    ];

  networking.hostName = "al-laptop-nixos"; # Define your hostname.
}
