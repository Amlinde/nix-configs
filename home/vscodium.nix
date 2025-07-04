{ pkgs, inputs, ... }:
let
  marketplace = inputs.nix-vscode-extensions.extensions.x86_64-linux.vscode-marketplace;
  vstuc = marketplace.visualstudiotoolsforunity.vstuc.overrideAttrs (_: { sourceRoot = "extension"; });
in
{
  programs.vscode = {
    enable = true;
    package = pkgs.vscodium;
    profiles.default.extensions = with marketplace; [
      arrterian.nix-env-selector
      jnoortheen.nix-ide
      rust-lang.rust-analyzer
      ms-python.python
    ];
  };
}
