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
  
  hm.home.packages = with pkgs; [
    netcat-openbsd
    android-tools
    prismlauncher
    xdg-user-dirs
    p7zip
    pulsemixer
    bluetui
    sops
    krita
    doggo
    libqalculate
    tealdeer
    jq
  ];
}
