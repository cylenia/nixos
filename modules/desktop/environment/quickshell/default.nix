{ pkgs, ... }: {
  hm.programs.quickshell = {
    enable = true;
    activeConfig = null;
  };

  services.upower.enable = true;
  hm.home.packages = [
    pkgs.libnotify
  ];

  hm.home.file.quickshell = {
    enable = true;
    executable = true;
    target = ".config/quickshell";
    source = ./config;
  };
}
