{
  description = "flask-example";
  inputs = {
    platform-engineering.url = "github:slimslenderslacks/nix-modules";
    nixpkgs.url = "github:nixos/nixpkgs/release-22.11";
  };
  outputs = { nixpkgs, ... }@inputs:
    inputs.platform-engineering.python-project
      {
        inherit nixpkgs;
        dir = ./.;
        package-overlay = pkgs: packages:
          packages // {
            default = pkgs.writeShellScriptBin "entrypoint" ''
              	    ${packages.app}/bin/app
              	  '';
          };
      };
}
