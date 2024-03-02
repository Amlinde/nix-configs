{ pkgs, ... }:
{
  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    # -- Core --
    micro
    wineWowPackages.stable
    fira-code
    libnotify
    
    # -- Cli --
    git
    btop
    nixpkgs-fmt
    asdf-vm
    neofetch
    wget
    ripgrep

    # -- Compilers/Interpreters --
    python3
    rustup

    # -- Config --
    nwg-look
    winetricks
    protontricks
    sddm-kcm

    # -- Utilities
    isoimagewriter
    partition-manager
    bottles
    kate
    vscodium
    kitty

    # -- Desktop --
    discover
    firefox
    thunderbird
    discord
  ];

  programs.steam.enable = true;

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };
}
