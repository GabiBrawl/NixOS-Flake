{ config, pkgs, unstable, hyprland, ... }:

let
  username = "gabriel";
in
{
  imports = [
    ../modules/base.nix
    ../modules/gnome.nix
    ../modules/hyprland.nix
  ];

  networking.hostName = "gabriel-pc";
  time.timeZone = "Europe/Lisbon";

  i18n.defaultLocale = "en_US.UTF-8";
  console.keyMap = "pt-latin1";

  users.users = {
    # Your user
    "${username}" = {
      isNormalUser = true;
      extraGroups = [ "wheel" "networkmanager" ];
      openssh.authorizedKeys.keys = []; # Add your SSH keys here later if you want
      initialPassword = "changeme"; # Please change after install
      shell = pkgs.zsh;
    };
  };

  services.openssh.enable = true;
  services.openssh.permitRootLogin = "no";

  # Enable NetworkManager
  networking.networkmanager.enable = true;

  # Boot loader setup for UEFI + Secure Boot capable (you can disable Secure Boot later if needed)
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # AMD GPU support for Ryzen 5 5600G
  hardware.enableAllFirmware = true;
  boot.initrd.kernelModules = [ "amdgpu" ];

  # Systemd services
  services.xserver.enable = true;
  services.xserver.displayManager.gdm.enable = true;

  # Desktop environments
  services.xserver.desktopManager.gnome.enable = true;

  # You’ll be able to log into Hyprland from GDM thanks to the hyprland module.

  environment.systemPackages = with pkgs; [
    git
    vim
    neofetch
    wget
    curl
    firefox
    kitty
    zsh
  ];

  system.stateVersion = "24.05"; # Match nixpkgs version
}
