{ pkgs, ... }:
{
  services.udev.extraHwdb = ''
    id-input:modalias:input:*vCAFEpA301*
      ID_INPUT_ACCELEROMETER=0
      ID_INPUT_JOYSTICK=1
  '';
}
