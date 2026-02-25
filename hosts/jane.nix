{ lib, config, modulesPath, inputs, ... }: {
  imports = [
    (lib.mkAliasOptionModule [ "hm" ] [ "home-manager" "users" "cylenia" ])
    (modulesPath + "/installer/scan/not-detected.nix")
    "${inputs.self}/modules/desktop"
    "${inputs.self}/modules/common"
  ];

  networking.hostName = "jane";
  hardware.bluetooth.enable = true;

  boot.initrd.availableKernelModules = [ "xhci_pci" "nvme" "usb_storage" "usbhid" "sd_mod" "rtsx_pci_sdmmc" ];
  boot.kernelModules = [ "kvm-intel" ];
  hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;

  fileSystems."/" = {
    device = "/dev/disk/by-uuid/a6503560-6734-453c-82a7-3cb42b2cc478";
    fsType = "btrfs";
    options = [ "subvol=@" ];
  };

  fileSystems."/home" = {
    device = "/dev/disk/by-uuid/a6503560-6734-453c-82a7-3cb42b2cc478";
    fsType = "btrfs";
    options = [ "subvol=@home" ];
  };

  fileSystems."/boot" = {
    device = "/dev/disk/by-uuid/DDFB-2A14";
    fsType = "vfat";
    options = [ "fmask=0077" "dmask=0077" ];
  };
  
  swapDevices = [{ device = "/dev/disk/by-uuid/69061212-53f2-4d70-836f-8dc5ba624ab1"; }];

  # don't change this!
  system.stateVersion = "25.11";
  hm.home.stateVersion = "25.11";
}
