{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
  };

  outputs = { self, nixpkgs }: 
    let 
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in
      {
        devShells.${system}.default = 
            # https://ryantm.github.io/nixpkgs/builders/special/mkshell/
            pkgs.mkShell {
                packages = [
                    pkgs.sqlite
                ];
            };
      };
}
