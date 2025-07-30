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
    hyprland
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

  # Create the session file so GDM can see Hyprland
  environment.etc."xdg/autostart/hyprland.desktop".text = hyprlandSession;

  # Sound and network
  sound.enable = true;
  hardware.pulseaudio.enable = true;
  networking.networkmanager.enable = true;
}
