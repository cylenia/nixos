{ ... }: {
  services.home-assistant = {
    enable = true;
    config.http.server_port = 8068;
    config.homeassistant = {
      name = "Home";
      time_zone = "Australia/Sydney";
      latitude = -37.8;
      longitude = 144.9;
      unit_system = "metric";
      temperature_unit = "C";
    };
  };
}
