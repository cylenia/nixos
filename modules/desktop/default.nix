{ ... }: {
  imports = [
    ./audio.nix
    ./xdg.nix
    ./environment
    ./tools
  ];

  services.gnome.gnome-keyring.enable = true;
}
