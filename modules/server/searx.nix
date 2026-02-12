{ ... }: {
  services.searx = {
    enabled = true;
    domain = "search.cylenia.dev";
    settings = {
      search.formats = [ "html" "json" ];
      server = {
        base_url = "https://search.cylenia.dev";
        port = 8069;
        secret_key = "This isn't used because I don't have an image proxy or use Redis";
        method = "GET";
      };
    };
  };
}
