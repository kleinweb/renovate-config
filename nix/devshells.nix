{
  perSystem =
    {
      config,
      inputs',
      pkgs,
      ...
    }:
    let
      commonPkgs = [
        # <https://github.com/numtide/treefmt-nix/blob/main/README.md#flake-parts>
        config.treefmt.build.wrapper

        pkgs.biome
        pkgs.just
      ];
    in
    {
      devShells.default = pkgs.mkShellNoCC {
        shellHook = ''
          ${config.pre-commit.installationScript}
        '';
        nativeBuildInputs = commonPkgs ++ [ pkgs.cocogitto ];
      };

      devShells.ci = pkgs.mkShellNoCC { nativeBuildInputs = commonPkgs; };
    };
}
