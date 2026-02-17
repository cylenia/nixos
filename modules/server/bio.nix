{ pkgs, ... }:
let
  bioSite = pkgs.callPackage (pkgs.fetchFromGitHub {
    owner = "cylenia-xd";
    repo = "bio";
    rev = "7abb3a72506777e31a017fc290c3b749288c76fe";
    hash = "sha256-tdTD8RgafiWaTqRNc46Pr2FreLJi0QzONJ1BgW0ap0s=";
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
