{ pkgs, ... }:
let
  bioSite = pkgs.callPackage (pkgs.fetchFromGitHub {
    owner = "cylenia-xd";
    repo = "bio";
    rev = "e6c392636ef43d824deb2a73d248cf75c385ae3f";
    hash = "sha256-RnajQZ4FJqxAy60BgWYoVd+5gHhjnBCU0RvnLio9D7Q=";
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
