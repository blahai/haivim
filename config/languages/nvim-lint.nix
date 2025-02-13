{
  lib,
  config,
  ...
}: {
  options = {nvim-lint.enable = lib.mkEnableOption "Enable nvim-lint module";};
  config = lib.mkIf config.nvim-lint.enable {
    plugins.lint = {
      enable = true;
      lintersByFt = {
        c = ["cpplint"];
        cpp = ["cpplint"];
        go = ["golangci-lint"];
        nix = ["statix"];
        lua = ["selene"];
        python = ["flake8"];
        json = ["jsonlint"];
        bash = ["shellcheck"];
      };
    };
  };
}
