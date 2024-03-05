{pkgs, ...}:
{
programs.vscodium = {
  enable = true;
  extensions = with pkgs.vscode-extensions; [
    bbenoist.Nix
    VisualStudioToolsForUnity.vstuc
    
  ];
};
}