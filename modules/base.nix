{ config, pkgs, ... }:

{
  fonts.packages = with pkgs; [
    noto-fonts
    ttf-jetbrains-mono
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
