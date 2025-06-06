{
  lib,
  config,
  ...
}: {
  options = {neo-tree.enable = lib.mkEnableOption "Enable neo-tree module";};
  config = lib.mkIf config.neo-tree.enable {
    plugins.neo-tree = {
      enable = true;
      enableDiagnostics = true;
      enableGitStatus = true;
      enableModifiedMarkers = true;
      enableRefreshOnWrite = true;
      closeIfLastWindow = true;
      popupBorderStyle = "rounded"; # Type: null or one of “NC”, “double”, “none”, “rounded”, “shadow”, “single”, “solid” or raw lua code
      buffers = {
        bindToCwd = false;
        followCurrentFile = {enabled = true;};
      };
      eventHandlers = {
        file_opened = ''
          function(file_path)
            --auto close
            require("neo-tree").close_all()
          end
        '';
      };
      window = {
        width = 40;
        height = 15;
        autoExpandWidth = false;
        mappings = {"<space>" = "none";};
      };
    };

    keymaps = [
      {
        mode = "n";
        key = "<leader>E";
        action = ":Neotree focus<cr>";
        options = {
          silent = true;
          desc = "Explorer NeoTree (root dir)";
        };
      }
      {
        mode = "n";
        key = "<leader>e";
        action = "<cmd>Neotree toggle reveal<CR>";
        options = {
          silent = true;
          desc = "Explorer NeoTree (cwd)";
        };
      }
      {
        mode = "n";
        key = "<leader>be";
        action = ":Neotree buffers<CR>";
        options = {
          silent = true;
          desc = "Buffer explorer";
        };
      }
      {
        mode = "n";
        key = "<leader>ge";
        action = ":Neotree git_status<CR>";
        options = {
          silent = true;
          desc = "Git explorer";
        };
      }
    ];
  };
}
