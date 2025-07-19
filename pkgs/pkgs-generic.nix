{ pkgs, ... }:
let
  prismlauncher = pkgs.prismlauncher.override { jdks = with pkgs; [ temurin-bin-8 temurin-bin-17 temurin-bin-21 ]; };
in
{
  imports = [
  ];
  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    # -- Core --
    micro
    wineWowPackages.stable
    libnotify

    # -- Cli --
    btop
    nixpkgs-fmt
    asdf-vm
    fastfetch
    wget
    ripgrep
    scrcpy
    p7zip
    unrar
    yt-dlp
    pcsc-tools
    usb-modeswitch
    pciutils
    usbutils
	
    # -- Dev --
    godot_4
#    unityhub
    ldtk
    git
    git-lfs
    gh

    # -- Config --
    winetricks
    protontricks
    kdePackages.sddm-kcm

    # -- Utilities
    kdePackages.isoimagewriter
    kdePackages.partitionmanager
    bottles
    kdePackages.kate
    kitty

    # -- Desktop --
    firefox
    thunderbird
    discord
    vesktop
    kdePackages.xwaylandvideobridge
    krita
    inkscape
    kdePackages.kalk
    mpv
    vlc
    prismlauncher
  ];

  fonts.packages = with pkgs; [
    fira-code
    vistafonts
#    corefonts
  ];

  services.udev.packages = [ pkgs.dolphin-emu ];
  programs.adb.enable = true;
  programs.kdeconnect.enable = true;
  programs.wireshark.enable = true;
  programs.zsh.enable = true;

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
    pinentryPackage = pkgs.pinentry-curses;
  };
}
