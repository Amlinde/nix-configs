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

    # -- Dev --
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
    xwaylandvideobridge
    krita
    kdePackages.kalk
  ];

  fonts.packages = with pkgs; [
    fira-code
    vistafonts
    corefonts
  ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };
}
