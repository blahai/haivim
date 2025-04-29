{
  lib,
  config,
  ...
}: {
  imports = [
    ./nvim-lint.nix
    ./rust.nix
    ./treesitter-nvim.nix
  ];

  options = {languages.enable = lib.mkEnableOption "Enable languages module";};
  config = lib.mkIf config.languages.enable {
    nvim-lint.enable = lib.mkDefault true;
    rust.enable = lib.mkDefault true;
    treesitter-nvim.enable = lib.mkDefault true;
  };
}
