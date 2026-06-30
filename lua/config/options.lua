-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
-- Copilot en suggestions inline (ghost text + <Tab> pour accepter) plutôt que
-- comme source du menu de complétion. Doit être défini avant le chargement des
-- specs (l'extra ai.copilot lit vim.g.ai_cmp à l'évaluation).
vim.g.ai_cmp = false

local opt = vim.opt

opt.showtabline = 0
opt.spelllang = { "en", "fr" }
