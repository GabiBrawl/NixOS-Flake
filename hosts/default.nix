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
    "${username}" = {
      isNormalUser = true;
      extraGroups = [ "wheel" "networkmanager" ];
      openssh.authorizedKeys.keys = [];
      initialPassword = "changeme";
      shell = pkgs.zsh;
    };
  };

  services.openssh.enable = true;
  services.openssh.settings.PermitRootLogin = "no";

  networking.networkmanager.enable = true;

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  hardware.enableAllFirmware = true;
  boot.initrd.kernelModules = [ "amdgpu" ];

  services.xserver.enable = true;
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;

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

  fileSystems = {
    "/" = {
      device = "/dev/sda2"; # Adjust if different
      fsType = "ext4";
    };
    "/boot" = {
      device = "/dev/sda1"; # Adjust if different
      fsType = "vfat";
    };
  };

  system.stateVersion = "24.05";
}
