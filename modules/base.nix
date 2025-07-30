{ config, pkgs, ... }:

{
  fonts.packages = with pkgs; [
    noto-fonts
    jetbrains-mono       # changed here too
    texlivePackages.fontawesome5
  ];

  programs.zsh.enable = true;

  environment.systemPackages = with pkgs; [
    htop
    tree
  ];

  services.printing.enable = true;

  networking.firewall.enable = true;
}
