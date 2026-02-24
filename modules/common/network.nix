{ ... }: {
  networking.networkmanager.enable = true;
  networking.firewall.enable = false;
  networking.nameservers = [
    "103.196.38.38"
    "103.196.38.39"
    "103.196.38.40"
  ];
}
