{ pkgs, ... }: {
  hm.programs.nvf = {
    enable = true;
    settings = {
      vim.theme = {
        enable = true;
        name = "catppuccin";
        style = "mocha";
      };
      vim.lsp = {
        enable = true;
      };
    };
  };
}
