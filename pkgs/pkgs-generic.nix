{ pkgs, ... }:
{
  imports = [
    ./rider.nix
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
    neofetch
    wget
    ripgrep
    scrcpy
    p7zip
    unrar

    # -- Dev --
    godot_4
    unityhub
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
    kate
    kitty

    # -- Desktop --
    firefox
    thunderbird
    discord
    vesktop
    xwaylandvideobridge
    krita
    kdePackages.kalk
    avalonia-ilspy
  ];

  fonts.packages = with pkgs; [
    fira-code
    vistafonts
#    corefonts
  ];

  services.udev.packages = [ pkgs.dolphinEmu ];
  programs.adb.enable = true;
  programs.kdeconnect.enable = true;
  programs.wireshark.enable = true;

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };
}
