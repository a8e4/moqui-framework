{ pkgs ? import <nixpkgs> {} }:

with pkgs;

let java = jdk11;
    gradle = pkgs.gradle.overrideAttrs (p: { defaultJava = java; });
in  stdenv.mkDerivation {
    name = "erp";
    srcs = ./framework/src;
    buildInputs = [java gradle docker];
}