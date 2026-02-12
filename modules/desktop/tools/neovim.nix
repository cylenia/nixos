{ ... }: {
  hm.programs.nvf = {
    enable = true;
    settings = {
      vim = {
        options = {
          shiftwidth = 2;
          tabstop = 2;
        };
        theme = {
          enable = true;
          name = "catppuccin";
          style = "mocha";
        };
        languages = {
          enableTreesitter = true;
          enableFormat = true;
        };
        lsp.enable = true;
        git.enable = true;
        statusline.lualine.enable = true;
      };
    };
  };
}
