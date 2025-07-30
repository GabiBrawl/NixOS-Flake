{ config, pkgs, ... }:

{
  services.xserver.desktopManager.gnome.enable = true;

  # Enable GNOME keyring with proper option
  services.gnome.gnome-keyring.enable = true;

  environment.systemPackages = with pkgs; [
    gnome.gnome-terminal
    gnome.nautilus
    gnome.gnome-control-center
    gedit
  ];

  # The GNOME keyring service is usually enabled by the above option,
  # but if you want to add a systemd user service manually:
  systemd.user.services."gnome-keyring-daemon" = {
    description = "GNOME Keyring Daemon";
    wantedBy = [ "default.target" ];
    serviceConfig.ExecStart = "${pkgs.gnome-keyring}/bin/gnome-keyring-daemon --start --foreground --components=secrets";
  };
}
