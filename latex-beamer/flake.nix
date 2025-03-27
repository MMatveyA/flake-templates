{
  description = "Description"; # WARNING: EDIT HERE
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.11";
    flake-utils.url = "github:numtide/flake-utils";
  };
  outputs = { self, nixpkgs, flake-utils }:
    with flake-utils.lib;
    eachSystem allSystems (system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
        tex = pkgs.texlive.combine {
          inherit (pkgs.texlive)
            # Base
            scheme-basic collection-luatex latexmk beamer

            # Language
            polyglossia hyphenat

            # Bibliography
            biblatex biblatex-gost biber csquotes

            # Additional packages
            hyperref

            # Dependencies
            xstring;
        };
      in
      rec {
        packages = {
          document = pkgs.stdenvNoCC.mkDerivation rec {
            name = "package-name"; # WARNING: EDIT HERE
            src = self;
            buildInputs = [ pkgs.coreutils tex ];
            phases = [ "unpackPhase" "buildPhase" "installPhase" ];
            env = {
              PATH = "${pkgs.lib.makeBinPath buildInputs}";
              OSFONTDIR = "${pkgs.liberation_ttf}/share/fonts";
              TEXMFHOME = ".cache";
              TEXMFVAR = ".cache/texmf-var";
              SOURCE_DATE_EPOCH = self.sourceInfo.lastModified;
            };
            buildPhase = ''
              runHook preBuild

              latexmk ./main.tex

              runHook postBuild
            '';
            installPhase = ''
              runHook preInstall

              install -m644 -D out/*.pdf $out/${name}.pdf

              runHook postInstall
            '';
          };
          develop = packages.document;
        };
        defaultPackage = packages.document;
      });
}
