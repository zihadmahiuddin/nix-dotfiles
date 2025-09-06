{
  description = "My nix config";

  inputs = {
    # Nixpkgs
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    # Home manager
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    # Nix gaming
    nix-gaming.url = "github:fufexan/nix-gaming";
    nix-gaming.inputs.nixpkgs.follows = "nixpkgs";

    # Lanzaboote
    lanzaboote.url = "github:nix-community/lanzaboote";
    lanzaboote.inputs.nixpkgs.follows = "nixpkgs";

    # Hyprland
    hyprland.url = "github:hyprwm/Hyprland";
    hyprland.inputs.nixpkgs.follows = "nixpkgs";

    caelestia-shell = {
      url = "github:caelestia-dots/shell";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, lanzaboote, nix-gaming, ... }@inputs:
    let
      inherit (self) outputs;
      forAllSystems = nixpkgs.lib.genAttrs [
        "x86_64-linux"
        "aarch64-linux"
      ];
      extraConfig = {
        fontFamily = "Maple Mono NF";
        symbolsFontFamily = "Symbols Nerd Font Mono";
      };
    in
    rec {
      packages = forAllSystems (system:
        let pkgs = nixpkgs.legacyPackages.${system};
        in import ./pkgs { inherit pkgs; }
      );

      devShells = forAllSystems (system:
        let pkgs = nixpkgs.legacyPackages.${system};
        in import ./shell.nix { inherit pkgs; }
      );

      overlays = import ./overlays { inherit inputs; };

      nixosModules = import ./modules/nixos;
      homeManagerModules = import ./modules/home-manager;

      # NixOS configuration entrypoint
      # Available through 'nixos-rebuild --flake .#hostname'
      nixosConfigurations = {
        # "Sora" is my desktop
        # "Kibou" is my VM for experimenting
        # "Kumo" is my server
        # In the future my laptop would have "Ame" :D
        sora = nixpkgs.lib.nixosSystem {
          specialArgs = { inherit inputs outputs extraConfig; };
          modules = [
            nix-gaming.nixosModules.pipewireLowLatency
            lanzaboote.nixosModules.lanzaboote
            ./nixos/sora/configuration.nix
          ];
        };
        kibou = nixpkgs.lib.nixosSystem {
          specialArgs = { inherit inputs outputs extraConfig; };
          modules = [
            ./nixos/kibou/configuration.nix
          ];
        };
        kumo = nixpkgs.lib.nixosSystem {
          specialArgs = { inherit inputs outputs extraConfig; };
          modules = [
            ./nixos/kumo/configuration.nix
          ];
        };
      };

      # Standalone home-manager configuration entrypoint
      # Available through 'home-manager --flake .#username@hostname'
      homeConfigurations = {
        "zihad@sora" = home-manager.lib.homeManagerConfiguration {
          pkgs = nixpkgs.legacyPackages.x86_64-linux; # Home-manager requires 'pkgs' instance
          extraSpecialArgs = { inherit inputs outputs extraConfig; system = "x86_64-linux"; };
          modules = [
            ./home-manager/common
            ./home-manager/desktop
          ];
        };
        "zihad@kibou" = home-manager.lib.homeManagerConfiguration {
          pkgs = nixpkgs.legacyPackages.x86_64-linux; # Home-manager requires 'pkgs' instance
          extraSpecialArgs = { inherit inputs outputs extraConfig; system = "x86_64-linux"; };
          modules = [
            ./home-manager/common
            ./home-manager/desktop
          ];
        };
        "zihad@kumo" = home-manager.lib.homeManagerConfiguration {
          pkgs = nixpkgs.legacyPackages.aarch64-linux; # Home-manager requires 'pkgs' instance
          extraSpecialArgs = { inherit inputs outputs extraConfig; system = "aarch64-linux"; };
          modules = [
            ./home-manager/common
          ];
        };
      };
    };
}
