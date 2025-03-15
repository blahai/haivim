{
  lib,
  config,
  ...
}: {
  options = {lazy.enable = lib.mkEnableOption "Enable lz-n module";};
  config = lib.mkIf config.lazy.enable {
    plugins = {
      lz-n = {
        enable = true;
        autoLoad = true;
        plugins = [
          {
            __unkeyed-1 = "neo-tree.nvim";
            after = ''
              function()
                require("neo-tree").setup()
              end
            '';
            enabled = ''
              function()
              return true
              end
            '';
            keys = [
              {
                __unkeyed-1 = "<leader>e";
                __unkeyed-2 = "<CMD>Neotree toggle<CR>";
                desc = "NeoTree toggle";
              }
            ];
          }
          {
            __unkeyed-1 = "telescope.nvim";
            cmd = [
              "Telescope"
            ];
            keys = [
              {
                __unkeyed-1 = "<leader>fe";
                __unkeyed-2 = "<CMD>Telescope live_grep<CR>";
                desc = "Telescope autocommands";
              }
              {
                __unkeyed-1 = "<leader>b";
                __unkeyed-2 = "<CMD>Telescope buffers<CR>";
                desc = "Telescope buffers";
              }
            ];
          }
        ];
      };
    };
  };
}
