{ pkgs, ... }:
let
  bioSite = pkgs.callPackage (pkgs.fetchFromGitHub {
    owner = "cylenia-xd";
    repo = "bio";
    rev = "24183a99e9df65ab47616b510b0f95a215465d78";
  }) {};
in {
  systemd.services.bio = {
    enable = true;
    wantedBy = [ "multi-user.target" ];

    environment.PORT = "8068";

    serviceConfig = {
      ExecStart = "${pkgs.bun}/bin/bun ${bioSite}/index.js";
      Restart = "always";
      WorkingDirectory = "/";
    };
  };
}
