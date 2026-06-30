return {
  { "akinsho/bufferline.nvim", enabled = false },
  -- neotest est désactivé : aucun adaptateur fonctionnel ici.
  --   - Java    -> lancé par jdtls (extra LazyVim `lang.java`) : <leader>tt/tr/tT buffer-local
  --   - Angular -> builder `@angular/build:unit-test` -> `ng test` (voir frontend-test.lua)
  -- Pour revenir à neotest (ex. si on ajoute un jour neotest-java), remettre enabled=true.
  { "nvim-neotest/neotest", enabled = false },
  { "marilari88/neotest-vitest", enabled = false },
}
