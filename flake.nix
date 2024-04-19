{
  description = "simple-chat dev-shell";

  inputs = {
    flake-utils.url = "github:numtide/flake-utils";
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    rust-overlay.url = "github:oxalica/rust-overlay";
  };

  outputs = { self, flake-utils, nixpkgs, rust-overlay }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        overlays = [ (import rust-overlay) ];
        pkgs = import nixpkgs {
          inherit system overlays;
        };
      in
      with pkgs;
      {

        devShells.default = mkShell {
          buildInputs = [
            # Rust-related
            cargo-deny
            rust-bin.stable.latest.default
            rust-analyzer

            # Protobuf-related
            buf-language-server
            protobuf

            # Other
            just
            openssl
            pkg-config
          ];

          shellHook = ''
          '';
        };
      }
    );
}
