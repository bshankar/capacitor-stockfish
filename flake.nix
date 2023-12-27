{
  description = "Ionic dev environment";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
  };

  outputs = inputs @ { self, nixpkgs, ... }:
    let
      system = "x86_64-linux";

      pkgs = import nixpkgs {
        inherit system;
        config.allowUnfree = true;
      };

    in
    {
      devShell.x86_64-linux = pkgs.mkShell {
        buildInputs = with pkgs; [
          rnix-lsp
          efm-langserver
          nodejs
          nodePackages.pnpm
          nodePackages.typescript-language-server
          nodePackages.vscode-json-languageserver
          nodePackages.prettier
          android-studio
          python3
          pipenv
          python3Packages.python-lsp-server
          python3Packages.black
          python3Packages.requests
          transcrypt
          jdk
        ];
        CAPACITOR_ANDROID_STUDIO_PATH = "${pkgs.android-studio}/bin/android-studio";
        ANDROID_HOME = "/home/ebs/Documents/android/sdk";
      };
    };
}
