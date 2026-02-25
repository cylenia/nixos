{ ... }: {
  imports = [
    ./audio.nix
    ./xdg.nix
    ./environment
    ./programs
  ];

  services.gnome.gnome-keyring.enable = true;
}
