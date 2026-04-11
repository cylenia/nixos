{ pkgs, ... }: {
  hm.home.packages = [ pkgs.mpc ];
  hm.services.mpd = {
    enable = true;
    musicDirectory = "${hm.xdg.userDirs.music}";    
  };
}
