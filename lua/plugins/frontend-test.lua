-- Lancer les tests Angular (`ng test`) depuis Neovim, dans un terminal Snacks.
-- Le builder Angular `@angular/build:unit-test` pilote vitest lui-même : on passe
-- donc par `ng test` plutôt que par neotest-vitest (qui ne voit pas l'env Angular).
--
-- Les raccourcis sont globaux. Sur un buffer Java, jdtls (extra LazyVim `lang.java`)
-- redéfinit <leader>tt / <leader>tr / <leader>tT en buffer-local : ils gagnent
-- automatiquement, donc côté back ce sont bien les tests JUnit qui partent.

local function ng_root()
  local file = vim.api.nvim_buf_get_name(0)
  local start = file ~= "" and vim.fs.dirname(file) or vim.fn.getcwd()
  local found = vim.fs.find("angular.json", { upward = true, path = start })[1]
  return found and vim.fs.dirname(found) or nil
end

-- Lance `npx ng test <extra>` dans le projet Angular trouvé au-dessus du fichier courant.
local function run(extra)
  local root = ng_root()
  if not root then
    vim.notify("Aucun projet Angular (angular.json) au-dessus du fichier courant", vim.log.levels.WARN)
    return
  end
  Snacks.terminal.open("npx ng test " .. extra, {
    cwd = root,
    win = { position = "bottom", height = 0.4 },
  })
end

-- `--include` du builder Angular est relatif à la racine du projet (= dossier d'angular.json).
local function current_rel()
  local root = ng_root()
  if not root then
    return nil
  end
  local file = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(0), ":p")
  return vim.fn.shellescape(file:sub(#root + 2))
end

return {
  {
    "folke/snacks.nvim",
    keys = {
      {
        "<leader>tr",
        function()
          local rel = current_rel()
          if rel then
            run("--no-watch --include=" .. rel)
          end
        end,
        desc = "Front: tester le fichier courant",
      },
      {
        "<leader>tt",
        function()
          run("--no-watch")
        end,
        desc = "Front: tester toute la suite",
      },
      {
        "<leader>tw",
        function()
          local rel = current_rel()
          if rel then
            run("--watch --include=" .. rel)
          end
        end,
        desc = "Front: watch du fichier courant",
      },
      {
        "<leader>tW",
        function()
          run("--watch")
        end,
        desc = "Front: watch de toute la suite",
      },
    },
  },
}
