{
  description = "Saidgeek's machine configurations";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, home-manager, ... }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs {
        inherit system;
        config = {
          allowUnfree = true;
          overlays = [
            (self: super: {
              fcitx-engines = pkgs.fcitx5;
            })
          ];
        };
      };
      lib = nixpkgs.lib;
    in
    {

      nixosConfigurations = {
        l0kii = lib.nixosSystem {
          inherit system;
          modules = [
            {
              imports = [
                ./hosts/l0kii/configuration.nix
              ];
            }
          ];
        };
      };

      homeConfigurations = {
        "saidgeek@l0kii" = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          modules = [
            ./home.nix
          ];
        };
      };
    };
}
