{ config, pkgs, ... }:

{
  # Fonts & locale
  fonts.fonts = with pkgs; [
    noto-fonts
    ttf-jetbrains-mono
    ttf-font-awesome
  ];

  # Enable zsh globally
  programs.zsh.enable = true;

  # Common packages everyone wants
  environment.systemPackages = with pkgs; [
    htop
    tree
  ];

  # Enable printing services
  services.printing.enable = true;

  # Enable firewall (basic)
  networking.firewall.enable = true;
}
