{ ... }: {
  services.librechat = {
    enable = true;
    enableLocalDB = true;
    credentialsFile = "lorem ipsum";
    env = {
      HOST = "0.0.0.0";
      PORT = "8068";
      DOMAIN_CLIENT = "https://ai.cylenia.dev";
      DOMAIN_SERVER = "http://localhost:8068";
      ALLOW_REGISTRATION = true;
      HELP_AND_FAQ_URL = "https://www.youtube.com/watch?v=t9cWRSr4VRg";
      
    };
    settings = {
      interface = {
        privacyPolicy.externalUrl = "https://www.youtube.com/watch?v=t9cWRSr4VRg";
        termsOfService.externalUrl = "https://www.youtube.com/watch?v=t9cWRSr4VRg";
      };
      endpoints.custom = [{
        name = "HackClub";
        apiKey = "\${HACKCLUB_API_KEY}";
        baseURL = "https://ai.hackclub.com/proxy/v1/";
        titleConvo = true;
        titleModel = "google/gemini-3-flash-preview";
        models = {
          fetch = true;
          default = [
            "x-ai/grok-4.1-fast"
            "google/gemini-3-flash-preview"
          ];
        };
      }];
    };
  };
}
