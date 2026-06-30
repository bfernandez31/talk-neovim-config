-- Labels des groupes which-key pour nos préfixes maison.
-- <leader>t (test) n'est plus déclaré depuis qu'on a désactivé neotest ;
-- <leader>o (other / fichier alterné) est ajouté par other.lua.
return {
  {
    "folke/which-key.nvim",
    opts = function(_, opts)
      opts.spec = opts.spec or {}
      vim.list_extend(opts.spec, {
        { "<leader>t", group = "test", icon = { icon = "󰙨 ", color = "green" } },
        { "<leader>o", group = "other (fichier alterné)", icon = { icon = "󰬡 ", color = "blue" } },
      })
    end,
  },
}
