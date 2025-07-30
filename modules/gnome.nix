{ config, pkgs, ... }:

{
  services.xserver.desktopManager.gnome.enable = true;
  services.gnome.gnome-keyring.enable = true;

  # Add GNOME apps you want here:
  environment.systemPackages = with pkgs; [
    gnome.gnome-terminal
    gnome.nautilus
    gnome.gnome-control-center
    gnome.gedit
  ];

  # Optional: enable systemd user services for GNOME
  systemd.user.services = {
    "gnome-keyring-daemon" = {
      description = "GNOME Keyring Daemon";
      wantedBy = [ "default.target" ];
      serviceConfig.ExecStart = "${pkgs.gnome_keyring}/bin/gnome-keyring-daemon --start --foreground --components=secrets";
    };
  };
}
