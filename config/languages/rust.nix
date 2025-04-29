{
  lib,
  config,
  ...
}: {
  options = {rust.enable = lib.mkEnableOption "Enable rust specific shit";};
  config = lib.mkIf config.rust.enable {
    plugins = {
      crates = {
        enable = true;
      };
    };
  };
}
