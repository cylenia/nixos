{ pkgs, ... }: {
  imports = [
    ./caddy.nix
    ./immich.nix
    ./cloudflare.nix
    ./openssh.nix
    ./vaultwarden.nix    
    ./searx.nix
  ];

  environment.systemPackages = [ pkgs.git ];
}
