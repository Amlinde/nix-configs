{ pkgs, inputs, ... }:
let
  marketplace = inputs.nix-vscode-extensions.extensions.x86_64-linux.vscode-marketplace;
  vstuc = marketplace.visualstudiotoolsforunity.vstuc.overrideAttrs (_: { sourceRoot = "extension"; });
in
{
  programs.vscode = {
    enable = true;
    package = pkgs.vscodium.fhs;
    extensions = with marketplace; [
      bbenoist.nix
      vstuc
    ];
  };
}
