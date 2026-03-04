{ pkgs, ... }: {
  virtualisation.libvirtd.enable = true;
  programs.virt-manager.enable = true;
  users.users.cylenia.extraGroups = [ "libvirtd" ];
  environment.systemPackages = [ pkgs.dnsmasq ];
}
