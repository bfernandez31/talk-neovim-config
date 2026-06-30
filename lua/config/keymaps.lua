-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local keymap = vim.keymap
local opts = { noremap = true, silent = true }

-- Copy whole file content to clipboard with C-c
keymap.set("n", "<C-c>", ":%y+<CR>", opts)

-- Run exercise test based on current file
-- Pattern: exo-{name}-part-{n}.js in folder XX-{name} → npm run test:{X}-{name}:part{n}
local test_term_bufnr = nil

local function run_exercise_test()
  local filename = vim.fn.expand("%:t")

  -- Extract folder info (e.g., "01-function" → num=1, name=function)
  local folder = vim.fn.expand("%:p:h:t")
  local folder_num, folder_name = folder:match("^(%d+)-(.+)$")

  if not folder_num or not folder_name then
    vim.notify("Not in an exercise folder (expected XX-name pattern)", vim.log.levels.WARN)
    return
  end

  -- Extract part number from filename (e.g., "exo-function-part-1.js" → 1)
  local part_num = filename:match("part%-(%d+)%.")

  if not part_num then
    vim.notify("Not an exercise file (expected exo-*-part-N.js pattern)", vim.log.levels.WARN)
    return
  end

  -- Build command: test:{num}-{name}:part{part} (remove leading zeros)
  local test_num = tostring(tonumber(folder_num))
  local cmd = string.format("npm run test:%s-%s:part%s", test_num, folder_name, part_num)

  -- Close existing test terminal if present
  if test_term_bufnr and vim.api.nvim_buf_is_valid(test_term_bufnr) then
    vim.api.nvim_buf_delete(test_term_bufnr, { force = true })
  end

  -- Open terminal in bottom split and run command
  vim.cmd("botright 15split | terminal " .. cmd)
  test_term_bufnr = vim.api.nvim_get_current_buf()

  -- Return to previous window (the code file)
  vim.cmd("wincmd p")

  vim.notify("Running: " .. cmd, vim.log.levels.INFO)
end

keymap.set("n", "<leader>te", run_exercise_test, { desc = "Run exercise test" })
