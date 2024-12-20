{
  lib,
  config,
  ...
}: {
  options = {nvim-tree.enable = lib.mkEnableOption "Enable neo-tree module";};
  config =
    lib.mkIf config.nvim-tree.enable {
    };
}
