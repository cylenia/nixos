{ pkgs, ... }:
let
  bioSite = pkgs.callPackage (pkgs.fetchFromGitHub {
    owner = "cylenia-xd";
    repo = "bio";
    rev = "6dc313edc2dcea3ac9c7a65c84c4dd1139ed083c";
    hash = "sha256-T21GJDBZLZ5tlaOCM20aTc1R5RF2nVz+n/vfTtnOYZg=";
  }) {};
in {
  systemd.services.bio = {
    enable = true;
    wantedBy = [ "multi-user.target" ];

    environment.PORT = "8068";

    serviceConfig = {
      ExecStart = "${pkgs.bun}/bin/bun ${bioSite}/index.js";
      Restart = "always";
      WorkingDirectory = "${bioSite}";
    };
  };
}
