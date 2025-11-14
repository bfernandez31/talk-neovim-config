return {
  {
    "nvim-neotest/neotest",
    dependencies = {
      "nvim-neotest/nvim-nio",
      "nvim-lua/plenary.nvim",
      "antoinemadec/FixCursorHold.nvim",
      "nvim-treesitter/nvim-treesitter",
      -- Adaptateur Vitest
      "marilari88/neotest-vitest",
    },
    opts = function(_, opts)
      opts.adapters = opts.adapters or {}
      table.insert(
        opts.adapters,
        require("neotest-vitest")({
          -- Chemins de recherche des tests
          filter_dir = function(name, rel_path, root)
            -- Exclure node_modules et .next
            return name ~= "node_modules" and name ~= ".next"
          end,
          vitestCommand = "bun run test:unit",
          -- Patterns de détection des fichiers de test
          is_test_file = function(file_path)
            return file_path:match("%.test%.ts$")
          end,
          -- Adapter le CWD au projet
          cwd = function()
            return vim.fn.getcwd()
          end,
        })
      )
      return opts
    end,
    keys = {
      {
        "<leader>tr",
        function()
          require("neotest").run.run()
        end,
        desc = "Run nearest test",
      },
      {
        "<leader>tf",
        function()
          require("neotest").run.run(vim.fn.expand("%"))
        end,
        desc = "Run current file tests",
      },
      {
        "<leader>ta",
        function()
          require("neotest").run.run(vim.fn.getcwd())
        end,
        desc = "Run all tests",
      },
      {
        "<leader>ts",
        function()
          require("neotest").summary.toggle()
        end,
        desc = "Toggle test summary",
      },
      {
        "<leader>to",
        function()
          require("neotest").output.open({ enter = true })
        end,
        desc = "Show test output",
      },
      {
        "<leader>tp",
        function()
          require("neotest").output_panel.toggle()
        end,
        desc = "Toggle output panel",
      },
      {
        "<leader>tS",
        function()
          require("neotest").run.stop()
        end,
        desc = "Stop test",
      },
      {
        "<leader>tw",
        function()
          require("neotest").watch.toggle()
        end,
        desc = "Toggle test watch mode",
      },
    },
  },
}
