{ config, pkgs, unstable, hyprland, ... }:

{
  programs.hyprland.enable = true;

  environment.systemPackages = with pkgs; [
    hyprland
    hyprpaper
    waybar
    wofi
    swww
    rofi
    ttf-jetbrains-mono
    ttf-font-awesome
    alacritty
    kitty
    networkmanager
    pulseaudio
  ];

  # Set Hyprland as a login option at GDM
  services.xserver.windowManager.hyprland.enable = true;

  # Enable pulseaudio for sound
  sound.enable = true;
  hardware.pulseaudio.enable = true;

  # Enable NetworkManager for connectivity (already in base, but safer)
  networking.networkmanager.enable = true;
}
