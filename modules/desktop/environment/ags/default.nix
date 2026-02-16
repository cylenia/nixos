{ inputs, pkgs, ... }: {
  programs.ags = {
    enable = true;
    configDir = ./config;
    extraPackages = [
      inputs.astal.packages.${pkgs.system}.battery
    ];
  };
}
