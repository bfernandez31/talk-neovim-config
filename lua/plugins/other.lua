return {
  "rgroli/other.nvim",
  event = "VeryLazy",
  config = function()
    require("other-nvim").setup({
      mappings = {
        -- Détection automatique générique
        {
          pattern = "(.*)/(.*).ts$",
          target = {
            { target = "%1/%2.test.ts", context = "test" },
            { target = "%1/%2.spec.ts", context = "spec" },
            { target = "tests/%1/%2.test.ts", context = "test" },
            { target = "tests/%1/%2.spec.ts", context = "spec" },
            { target = "test/%1/%2.test.ts", context = "test" },
            { target = "__tests__/%1/%2.test.ts", context = "test" },
          },
        },
        {
          pattern = "(.*)/(.*)%.test.ts$",
          target = {
            { target = "%1/%2.ts", context = "source" },
          },
        },
        {
          pattern = "(.*)/(.*)%.spec.ts$",
          target = {
            { target = "%1/%2.ts", context = "source" },
          },
        },
        -- Pour les fichiers dans tests/ qui doivent retourner dans lib/ ou src/
        {
          pattern = "tests/(.*)/(.*)%.test.ts$",
          target = {
            { target = "lib/%1/%2.ts", context = "source" },
            { target = "src/%1/%2.ts", context = "source" },
            { target = "%1/%2.ts", context = "source" },
          },
        },
        {
          pattern = "tests/(.*)/(.*)%.spec.ts$",
          target = {
            { target = "lib/%1/%2.ts", context = "source" },
            { target = "src/%1/%2.ts", context = "source" },
            { target = "%1/%2.ts", context = "source" },
          },
        },
        -- Patterns pour JavaScript
        {
          pattern = "(.*)/(.*).js$",
          target = {
            { target = "%1/%2.test.js", context = "test" },
            { target = "tests/%1/%2.test.js", context = "test" },
          },
        },
        {
          pattern = "(.*)/(.*)%.test.js$",
          target = {
            { target = "%1/%2.js", context = "source" },
            { target = "lib/%1/%2.js", context = "source" },
            { target = "src/%1/%2.js", context = "source" },
          },
        },
        -- Patterns pour React/Vue
        {
          pattern = "(.*)/(.*).tsx$",
          target = {
            { target = "%1/%2.test.tsx", context = "test" },
            { target = "tests/%1/%2.test.tsx", context = "test" },
          },
        },
        {
          pattern = "(.*)/(.*)%.test.tsx$",
          target = {
            { target = "%1/%2.tsx", context = "source" },
            { target = "lib/%1/%2.tsx", context = "source" },
            { target = "src/%1/%2.tsx", context = "source" },
          },
        },
        -- Patterns pour Angular
        {
          pattern = "(.*)/(.*)%.component.ts$",
          target = {
            { target = "%1/%2.component.spec.ts", context = "test" },
          },
        },
        {
          pattern = "(.*)/(.*)%.component.spec.ts$",
          target = {
            { target = "%1/%2.component.ts", context = "source" },
          },
        },
      },
      -- Essayer tous les patterns et ouvrir le premier fichier trouvé
      style = {
        border = "rounded",
        separator = "|",
        width = 0.7,
        minHeight = 2,
      },
    })
  end,
  keys = {
    {
      "<leader>ta",
      "<cmd>Other<cr>",
      desc = "Go to alternate file (test/source)",
    },
    {
      "<leader>tA",
      "<cmd>OtherVSplit<cr>",
      desc = "Go to alternate file in vsplit",
    },
    {
      "<leader>tS",
      "<cmd>OtherSplit<cr>",
      desc = "Go to alternate file in split",
    },
  },
}
