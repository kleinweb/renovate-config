{
  perSystem =
    { pkgs, ... }:
    {
      treefmt = {
        projectRootFile = "flake.nix";
        flakeCheck = true;
        settings.global.excludes = [ ];
        programs = {
          biome.enable = true;
          dos2unix.enable = true;
          keep-sorted.enable = true;
          nixfmt-rfc-style.enable = true;
        };
      };
    };
}
