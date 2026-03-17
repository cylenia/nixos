{ ... }: {
  services.home-assistant = {
    enable = true;
    config.http.server_port = 8068;
  };
}
