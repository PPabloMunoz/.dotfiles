{
  description = "Nix configuration for multiple hosts (Linux + macOS)";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, home-manager, ... }:
    let
      makeHostConfig = { system, hostname, extraModules ? [] }:
        home-manager.lib.homeManagerConfiguration {
          pkgs = import nixpkgs {
            inherit system;
            config.allowUnfree = true;
          };
          modules = extraModules ++ [
            ./home/default.nix
            ./hosts/${hostname}.nix
          ];
          extraSpecialArgs = { inherit hostname; };
        };

      configs = {
        linux-ssh = makeHostConfig {
          system = "aarch64-linux";
          hostname = "linux-ssh";
        };

        linux-ssh-x64 = makeHostConfig {
          system = "x86_64-linux";
          hostname = "linux-ssh-x64";
        };

        mac = makeHostConfig {
          system = "aarch64-darwin";
          hostname = "mac";
        };
      };
    in
    {
      homeConfigurations = configs;
    };
}
