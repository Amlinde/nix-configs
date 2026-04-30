{ pkgs, ... }:
{
  services.udev.extraRules = ''
    ATTR{idVendor}=="cafe", ATTR{idProduct}=="a301", MODE="0666", ENV{ID_INPUT_JOYSTICK}="1"
  '';
}
