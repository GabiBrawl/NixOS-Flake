{ pkgs, ... }: {
  home.username = "yourname";
  home.homeDirectory = "/home/yourname";
  home.stateVersion = "25.05";

  wayland.windowManager.hyprland = {
    enable = true;
    settings = {
      monitor = ",preferred,auto,1";
      general = {
        gaps_in = 5;
        gaps_out = 10;
        "col.active_border" = "rgba(33ccffee) rgba(00ff99ee) 45deg";
      };
    };
  };
}