{
  perSystem =
    { config, pkgs, ... }:
    {
      pre-commit.settings = {
        hooks = {
          markdownlint.enable = true;
          markdownlint.package = pkgs.markdownlint-cli2;
          treefmt.enable = true;
          yamllint.enable = true;
        };
        default_stages = [
          "pre-commit"
          "pre-push"
        ];
      };
    };
}
