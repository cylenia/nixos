{ pkgs, ... }:
let
  bioSite = pkgs.callPackage (pkgs.fetchFromGitHub {
    owner = "cylenia-xd";
    repo = "bio";
    rev = "2587974025f2c7541d5042d06a8cbeb5ab475572";
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
