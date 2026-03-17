{ ... }: {
  services.home-assistant = {
    enable = true;
    config.homeassistant = {
      name = "Home";
      time_zone = "Australia/Melbourne";
      latitude = -37.8;
      longitude = 144.9;
      unit_system = "metric";
      temperature_unit = "C";
    };
  };
}
