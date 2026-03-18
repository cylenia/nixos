{ pkgs, ... }: {
  imports = [
    ./git.nix
    ./ssh.nix
    ./helix.nix
    ./neomutt.nix
    ./fastfetch.nix
    ./firefox.nix
    ./steam.nix
  ];
  
  environment.systemPackages = with pkgs; [
    kdePackages.kmail
    gamescope
    netcat-openbsd
    android-tools
    prismlauncher
    xdg-user-dirs
    p7zip
    vesktop
    pulsemixer
    bluetui
    sops
    krita
    inkscape
    doggo
    libqalculate
    tealdeer
    jq
  ];
}
