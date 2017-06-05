{ mkDerivation, aeson, base, containers, reflex, stdenv }:
mkDerivation {
  pname = "reflex-aeson-orphans";
  version = "0.1.0.0";
  src = ./.;
  libraryHaskellDepends = [ aeson base containers reflex ];
  description = "Defines aeson FromJSON and ToJSON orphan instances for reflex data types";
  license = stdenv.lib.licenses.bsd3;
}
