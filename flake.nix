{
  description = "Data Structures and Algorithms with Multi-Language Support";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
    rust-overlay = {
      url = "github:oxalica/rust-overlay";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, flake-utils, rust-overlay }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        # Import overlays and create pkgs
        pkgs = import nixpkgs {
          inherit system;
          overlays = [ rust-overlay.overlays.default ];
        };

        # Rust toolchain
        rustToolchain = pkgs.rust-bin.stable.latest.default.override {
          extensions = [ "rust-src" "rustfmt" "clippy" ];
        };

        # Development shell with multiple language support
        devShell = pkgs.mkShell {
          buildInputs = with pkgs; [
            # C/C++ tools
            gcc
            clang
            cmake
            gnumake
            valgrind
            gdb

            # Python
            python311
            python311Packages.pip
            python311Packages.pytest
            python311Packages.numpy
            python311Packages.matplotlib

            # Haskell
            ghc
            cabal-install
            haskell-language-server
            
            # Rust
            rustToolchain
            cargo
            rust-analyzer

            # Common build and analysis tools
            git
            just
            ripgrep
            fd
          ];

          shellHook = ''
            echo "🚀 DSA Development Environment"
            echo "Supported Languages: C/C++, Python, Haskell, Rust"
            echo "--------------------------------------------"
            
            # Set up project structure if not exists
            mkdir -p {c_cpp,python,haskell,rust}/src
            
            # Create placeholder README
            if [ ! -f README.md ]; then
              cat > README.md << EOL
            # Data Structures and Algorithms Project

            ## Project Structure
            - \`c_cpp/\`: C and C++ implementations
            - \`python/\`: Python implementations
            - \`haskell/\`: Haskell implementations
            - \`rust/\`: Rust implementations

            ## Development
            Use \`nix develop\` to enter the development environment.
            EOL
            fi

            # Set up basic gitignore
            if [ ! -f .gitignore ]; then
              cat > .gitignore << EOL
            # Build directories
            **/build/
            **/target/
            **/dist/

            # Compiled files
            **/*.o
            **/*.out
            **/*.exe
            **/*.so
            **/*.a

            # Editor and IDE files
            .vscode/
            .idea/
            *.swp
            *~

            # Python
            **/__pycache__/
            **.pyc
            **.pyo
            **.pyd

            # Rust
            **/*.rs.bk

            # Haskell
            **/*.hi
            **/*.ho
            **.stack-work/
            EOL
            fi
          '';
        };
      in {
        # Define the development shell
        devShells.default = devShell;

        # Optional: add packages or apps if needed
        packages = {};
      }
    );
}
