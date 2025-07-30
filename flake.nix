{
  description = "GabiBrawl's NixOS config with Hyprland + GNOME";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.05";
    home-manager.url = "github:nix-community/home-manager/release-24.05";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    hyprland.url = "github:hyprwm/Hyprland";
    hyprland.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, home-manager, hyprland, ... }:
  let
    system = "x86_64-linux";

    pkgs = import nixpkgs {
      inherit system;
      config = {
        allowUnfree = true;
      };
    };

    unstable = import nixpkgs {
      inherit system;
      overlays = [ (final: prev: {
        # If you want to override packages or add fixes here, do it
      }) ];
    };
  in {
    nixosConfigurations.default = nixpkgs.lib.nixosSystem {
      inherit system;
      specialArgs = {
        inherit pkgs unstable hyprland;
      };
      modules = [
        ./hosts/default.nix
      ];
    };
  };
}
