{
  lib,
  config,
  ...
}: {
  options = {neocord.enable = lib.mkEnableOption "Enable neocord module";};
  config = lib.mkIf config.neocord.enable {
    plugins.neocord = {
      enable = true;
      settings = {
        auto_update = true;
        blacklist = [];
        client_id = "1157438221865717891";
        debounce_timeout = 10;
        editing_text = "Editing...";
        enable_line_number = true;
        logo = "https://raw.githubusercontent.com/IogaMaster/neovim/main/.github/assets/nixvim-dark.webp";
        logo_tooltip = "NeoVim";
        file_assets = null;
        file_explorer_text = "Browsing...";
        git_commit_text = "Committing changes...";
        global_timer = true;
        line_number_text = "Line %s out of %s";
        log_level = null;
        main_image = "logo";
        plugin_manager_text = "Managing plugins...";
        reading_text = "Reading...";
        show_time = true;
        terminal_text = "Using Terminal...";
        workspace_text = "Working on %s";
      };
    };
  };
}
