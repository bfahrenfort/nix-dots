{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";

    lix-module = {
      url = "https://git.lix.systems/lix-project/nixos-module/archive/2.91.1-1.tar.gz";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows =
        "nixpkgs"; # Use system packages list where available
    };
  };

  outputs = { self, nixpkgs, lix-module, home-manager }: {

    defaultPackage.x86_64-linux = home-manager.defaultPackage.x86_64-linux;
    # packages.x86_64-linux.hello = nixpkgs.legacyPackages.x86_64-linux.hello;

    # packages.x86_64-linux.default = self.packages.x86_64-linux.hello;
    homeConfigurations = {
        "b" = home-manager.lib.homeManagerConfiguration {
            # Note: I am sure this could be done better with flake-utils or something
            pkgs = import nixpkgs { system = "x86_64-linux"; };
            modules = [ ./home.nix ]; # Defined later
        };
    };
  };
}
