{ ... }: {
  imports = [
    ./audio.nix
    ./xdg.nix
    ./virt.nix
    ./environment
    ./programs
  ];

  services.gnome.gnome-keyring.enable = true;
}
