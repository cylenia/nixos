{ ... }: {
  hm.programs.nheko.enable = true;
  nixpkgs.config.permittedInsecurePackages = [ "olm-3.2.16" ];
}
