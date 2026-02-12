{ pkgs, ... }: {
  nixpkgs.config.allowUnfree = true;
  nix.package = pkgs.lixPackageSets.stable.lix;
  nix.settings = {
    experimental-features = [ "nix-command" "flakes" ];
    warn-dirty = false;
  };
}
