{ config, ... }: {
  sops.secrets.synapse_env = {};
  services.matrix-synapse = {
    enable = true;
    configureRedisLocally = true;
    enableRegistrationScript = true;
    extraConfigFiles = [ config.sops.secrets.synapse_env.path ];
    settings = {
      turn_uris = [
        "turn:standard.relay.metered.ca:80?transport=tcp"
        "turns:standard.relay.metered.ca:443?transport=tcp"
      ];
      turn_user_lifetime = "86400000";
      max_upload_size = "2G";
      public_baseurl = "https://matrix.cylenia.dev/";
      server_name = "cylenia.dev";
      listeners = [{
        bind_addresses = [ "127.0.0.1" ];
        port = 8068;
        resources = [
          { compress = true; names = [ "client" ]; }
          { compress = false; names = [ "federation" ]; }
        ];
        tls = false;
        type = "http";
        x_forwarded = true;
      }];
    };
  };
}
