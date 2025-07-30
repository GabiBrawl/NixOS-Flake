{ config, pkgs, ... }:

{
  fonts.packages = with pkgs; [
    pkgs.noto-fonts
    pkgs.ttf-jetbrains-mono
    pkgs.ttf-font-awesome
  ];

  programs.zsh.enable = true;

  environment.systemPackages = with pkgs; [
    pkgs.htop
    pkgs.tree
  ];

  services.printing.enable = true;

  networking.firewall.enable = true;
}
