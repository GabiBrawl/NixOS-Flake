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
      openssh.authorizedKeys.keys = []; # Add your SSH keys here later if you want
      initialPassword = "changeme"; # Please change after install
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
      device = "/dev/sda2"; # Adjust this if your root partition is different
      fsType = "ext4";      # Change to your root filesystem type if needed
    };
    "/boot" = {
      device = "/dev/sda1"; # Adjust if your EFI partition differs
      fsType = "vfat";
    };
  };

  system.stateVersion = "24.05";
}
