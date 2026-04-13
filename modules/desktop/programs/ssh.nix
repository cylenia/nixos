{ ... }: {
  hm.programs.ssh = {
    enable = true;
    enableDefaultConfig = false;
    matchBlocks = {
      paul = {
        hostname = "192.168.86.36";
        port = 22;
        user = "cylenia";
        setEnv.TERM = "xterm-256color";
      };
    };
  };
}
