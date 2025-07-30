{ config, pkgs, ... }:

{
  fonts.packages = with pkgs; [
    noto-fonts
    jetbrains-mono       # changed here too
    ttf-font-awesome
  ];

  programs.zsh.enable = true;

  environment.systemPackages = with pkgs; [
    htop
    tree
  ];

  services.printing.enable = true;

  networking.firewall.enable = true;
}
