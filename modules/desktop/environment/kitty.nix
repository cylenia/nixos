{ pkgs, ... }: {
  hm.programs.kitty = {
    enable = true;
    themeFile = "Catppuccin-Mocha";
    shellIntegration.enableBashIntegration = true;
    font = {
      name = "Hack Nerd Font Mono";
      package = pkgs.nerd-fonts.hack;
      size = 12;
    };
    settings = {
      single_window_margin_width = 2;
    };
  };
}
