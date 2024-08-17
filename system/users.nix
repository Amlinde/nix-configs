{ pkgs, ... }:
{
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.amlin = {
    isNormalUser = true;
    description = "Alex Linde";
    shell = pkgs.zsh;
    extraGroups = [ "networkmanager" "wheel" "adbusers" "kvm" ];
    packages = with pkgs; [
      r2modman
    ];
  };
}
