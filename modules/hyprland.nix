{ config, pkgs, ... }:

let
  hyprlandSession = ''
    [Desktop Entry]
    Name=Hyprland
    Comment=Hyprland Wayland Compositor
    Exec=Hyprland
    TryExec=Hyprland
    Type=Application
    DesktopNames=Hyprland
    Keywords=tiling;wm;wayland;
  '';
in {
  environment.systemPackages = with pkgs; [
    pkgs.hyprland
    pkgs.waybar
    pkgs.wofi
    pkgs.swww
    pkgs.rofi
    pkgs.ttf-jetbrains-mono
    pkgs.ttf-font-awesome
    pkgs.alacritty
    pkgs.kitty
    pkgs.networkmanager
    pkgs.pulseaudio
  ];

  environment.etc."xdg/autostart/hyprland.desktop".text = hyprlandSession;

  sound.enable = true;
  hardware.pulseaudio.enable = true;
  networking.networkmanager.enable = true;
}
