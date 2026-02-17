{ pkgs, ... }:
let
  bioSite = pkgs.callPackage (pkgs.fetchFromGitHub {
    owner = "cylenia-xd";
    repo = "bio";
    rev = "d1504ac88db272dc530c90c06a6acb60c7053ad6";
    hash = "sha256-Mn34hPsc6hlY66hhkDnXDcyj+HFM5MFJkp0ETsusvBQ=";
  }) {};
in {
  systemd.services.bio = {
    enable = true;
    wantedBy = [ "multi-user.target" ];

    environment.PORT = "8068";

    serviceConfig = {
      ExecStart = "${pkgs.bun}/bin/bun run ${bioSite}/index.js";
      Restart = "always";
      WorkingDirectory = bioSite;
    };
  };
}
