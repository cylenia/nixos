{ lib, config, modulesPath, inputs, ... }: {
  imports = [
    (lib.mkAliasOptionModule [ "hm" ] [ "home-manager" "users" "cylenia" ])
    (modulesPath + "/installer/scan/not-detected.nix")
    "${inputs.self}/modules/desktop"
    "${inputs.self}/modules/common"
  ];

  networking.hostName = "jane";
  hardware.bluetooth.enable = true;

  boot.initrd.availableKernelModules = [ "xhci_pci" "nvme" "usb_storage" "sd_mod" "rtsx_pci_sdmmc" ];
  boot.kernelModules = [ "kvm-intel" ];
  boot.initrd.luks.devices."cryptroot".device = "/dev/disk/by-uuid/671151a3-82f1-4946-940c-ae39ff3bbbbc";
  hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;

  fileSystems."/" = {
    device = "/dev/mapper/cryptroot";
    fsType = "xfs";
  };

  fileSystems."/boot" = {
    device = "/dev/disk/by-uuid/C90A-27F6";
    fsType = "vfat";
    options = [ "fmask=0077" "dmask=0077" ];
  };
  
  swapDevices = [{ device = "/dev/disk/by-uuid/e92d5d4f-5932-4b1c-a8de-3b2089da8ab8"; }];

  # don't change this!
  system.stateVersion = "25.11";
  hm.home.stateVersion = "25.11";
}
