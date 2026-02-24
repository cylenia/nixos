{ ... }: {
  networking.networkmanager.enable = true;
  networking.firewall.enable = false;
  networking.nameservers = [
    "168.138.12.137"
    "112.213.35.91"
  ];
}
