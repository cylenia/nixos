{ pkgs, ... }: {
  imports = [
    ./git.nix
    ./ssh.nix
    ./helix.nix
    ./neomutt.nix
    ./fastfetch.nix
    ./firefox.nix
    ./steam.nix
    ./mpd.nix
  ];
  
  environment.systemPackages = with pkgs; [
    stoat-desktop
    gamescope
    godot
    file
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
    qbittorrent
    tealdeer
    jq
  ];
}
