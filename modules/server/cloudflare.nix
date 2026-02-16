{ config, ... }: {
  sops.secrets.cloudflared_creds = {};
  services.cloudflared = {
    enable = true;
    tunnels = {
      "d72e6609-f673-4b3c-ba51-b497906820bc" = {
        credentialsFile = "${config.sops.secrets.cloudflared_creds.path}";
        default = "http_status:404";
      };
    };
  };
}
