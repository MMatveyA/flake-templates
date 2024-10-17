{ lib, llvmPackages_14, cmake, doxygen, gnumake, texliveFull }:
llvmPackages_14.stdenv.mkDerivation (finalAttrs: {
  pname = "project-name";
  version = "0.0";

  src = ./.;

  nativeBuildInputs = [ cmake doxygen gnumake texliveFull ];
  buildInputs = [ ];

  cmakeFlags = [ "-DBUILD_DOC=ON" ];

  env = {
    TEXMFHOME = ".cache";
    TEXMFVAR = ".cache/texmf-var";
  };

  meta = {
    description = "";
    homepage = "";
    license = lib.licenses.asl20-llvm;
    maintainers = with lib.maintainers; [ ];
  };
})
