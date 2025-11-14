-- Conditionally enable Angular LS only in Angular projects
return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        angularls = {
          -- Only start Angular LS if angular.json exists in project root
          root_dir = function(fname)
            local util = require("lspconfig.util")
            -- Look for angular.json to identify Angular projects
            local root = util.root_pattern("angular.json")(fname)
            -- Only return root if we actually found angular.json
            return root
          end,
        },
      },
    },
  },
}
