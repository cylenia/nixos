{ pkgs, ... }: {
  imports = [
    ./clipboard.nix
    ./greetd.nix
    ./kitty.nix
    ./niri.nix
    ./fuzzel.nix
    ./quickshell
  ];

  environment.systemPackages = [ pkgs.nerd-fonts.hack pkgs.catppuccin-kvantum ];

  qt = {
    enable = true;
    style = "kvantum";
  };

  hm.qt = {
    enable = true;
    style = {
      name = "kvantum";
    };
  };

  hm.home.pointerCursor = {
    gtk.enable = true;
    package = pkgs.catppuccin-cursors.mochaMauve;
    name = "catppuccin-mocha-mauve-cursors";
    size = 24;
  };

  hm.gtk = {
    enable = true;

    theme = {
      name = "Catppuccin-GTK-Dark";
      package = (pkgs.magnetic-catppuccin-gtk.override {
        accent = [ "mauve" ];
        shade = "dark";
        size = "compact";
      });
    };

    iconTheme = {
      package = pkgs.adwaita-icon-theme;
      name = "Adwaita";
    };

    font = {
      package = pkgs.nerd-fonts.hack;
      name = "Hack Nerd Font Mono";
      size = 12;
    };
  };
}
