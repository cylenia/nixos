{ pkgs, ... }: {
  hm.home.packages = [ pkgs.mpc ];
  hm.services.mpd = {
    enable = true;
    musicDirectory = "/home/cylenia/media/music";    
  };
}
