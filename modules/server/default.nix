{ pkgs, ... }: {
  imports = [
    ./bio.nix
    ./immich.nix
    ./cloudflare.nix
    ./openssh.nix
    ./vaultwarden.nix    
    ./searx.nix
    ./librechat.nix
  ];

  environment.systemPackages = [ pkgs.git ];
}
