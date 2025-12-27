{ pkgs, ... }: {
  imports = [ ./hardware-configuration.nix ];
  boot.loader.systemd-boot.enable = true;
  networking.hostName = "nixos";
  
  # The Magic Button
  programs.hyprland.enable = true;
  programs.hyprland.withUWSM = true; # Modern 2025 standard

  users.users.yourname = {
    isNormalUser = true;
    extraGroups = [ "wheel" ];
  };
  
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  system.stateVersion = "25.05";
}