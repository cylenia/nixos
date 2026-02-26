{ pkgs, inputs, ... }: {
  hm.programs.firefox = {
    enable = true;
    languagePacks = [ "en-GB" ];
    profiles.default = {
      id = 0;
      isDefault = true;
      name = "default";
      extensions = {
        force = true;
        packages = with inputs.firefox-addons.packages.${pkgs.stdenv.hostPlatform.system}; [
          bitwarden
          ublock-origin
          catppuccin-mocha-mauve
        ];
      };
      settings."extensions.activeThemeID" = "{76aabc99-c1a8-4c1e-832b-d4f2941d5a7a}"; # catpuccin-mocha-mauve
      search = {
        force = true;
        default = "searxng";
        engines = {
          bing.metaData.hidden = true;
          perplexity.metaData.hidden = true;
          ebay.metaData.hidden = true;
          google.metaData.hidden = true;
          ddg.metaData.hidden = true;
          wikipedia.metadata.hidden = true;

          searxng = {
            name = "SearXNG";
            urls = [{ template = "https://search.cylenia.dev/search?q={searchTerms}"; }];
            iconMapObj."16" = "https://search.cylenia.dev/favicon.ico";
            definedAliases = [ "@sng" ];
          };

          ddg-no-ai = {
            name = "DuckDuckGo No AI";
            urls = [{ template = "https://noai.duckduckgo.com/search?q={searchTerms}"; }];
            iconMapObj."16" = "https://duckduckgo.com/favicon.ico";
            definedAliases = [ "@ddg" ];
          };

          my-nixos = {
            name = "MyNixOS";
            urls = [{ template = "https://mynixos.com/search?q={searchTerms}"; }];
            iconMapObj."16" = "https://mynixos.com/favicon.ico";
            definedAliases = [ "@mno" ];
          };

          nixos-wiki = {
            name = "NixOS Wiki";
            urls = [{ template = "https://wiki.nixos.org/w/index.php?search={searchTerms}"; }];
            iconMapObj."16" = "https://nixos.org/favicon.ico";
            definedAliases = [ "@nw" ];
          };
        };
      };
    };
  };
}
