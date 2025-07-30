{ config, pkgs, ... }:

{
  home.username = "gabriel";
  home.homeDirectory = "/home/gabriel";

  # Packages installed for your user
  home.packages = with pkgs; [
    vscode
    spotify
    obs-studio
    neofetch
    zsh
    alacritty
  ];

  # Enable Zsh as your default shell
  programs.zsh.enable = true;

  # Example of managing your dotfiles (adjust paths as you like)
  home.file.".zshrc".text = ''
    export ZSH="$HOME/.oh-my-zsh"
    ZSH_THEME="agnoster"
    plugins=(git)
    source $ZSH/oh-my-zsh.sh
  '';

  # State version
  home.stateVersion = "24.05";
}
