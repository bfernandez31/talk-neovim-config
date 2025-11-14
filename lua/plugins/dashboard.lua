return {
  "snacks.nvim",
  opts = {
    dashboard = {
      preset = {
        pick = function(cmd, opts)
          return LazyVim.pick(cmd, opts)()
        end,
        header = [[
███████╗ ██████╗     ██████╗  █████╗ ██╗   ██╗███████╗
██╔════╝██╔═══██╗    ██╔══██╗██╔══██╗╚██╗ ██╔╝██╔════╝
███████╗██║   ██║    ██║  ██║███████║ ╚████╔╝ ███████╗
╚════██║██║   ██║    ██║  ██║██╔══██║  ╚██╔╝  ╚════██║
███████║╚██████╔╝    ██████╔╝██║  ██║   ██║   ███████║
╚══════╝ ╚═════╝     ╚═════╝ ╚═╝  ╚═╝   ╚═╝   ╚══════╝
                                                       ]],
        -- stylua: ignore
        ---@type snacks.dashboard.Item[]
        keys = {
          { icon = " ", key = "f", desc = "Find File", action = ":lua Snacks.dashboard.pick('files')" },
          { icon = " ", key = "n", desc = "New File", action = ":ene | startinsert" },
          { icon = " ", key = "r", desc = "Recent Files", action = ":lua Snacks.dashboard.pick('oldfiles')" },
          { icon = " ", key = "c", desc = "Config", action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})" },
          { icon = " ", key = "o", desc = "Old Config", action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.expand('~/.config/nvim.bak')})" },
          { icon = " ", key = "s", desc = "Restore Session", section = "session" },
          { icon = "󰒲 ", key = "l", desc = "Lazy", action = ":Lazy" },
          { icon = " ", key = "q", desc = "Quit", action = ":qa" },
        },
      },
    },
  },
}
