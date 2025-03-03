-- This is useful for showing key presses on screen on recordings or live streams.
return {
  "NStefan002/screenkey.nvim",
  cmd = "Screenkey",
  opts = {
    win_opts = {
      row = vim.o.lines - vim.o.cmdheight - 1, -- Keep it at the bottom
      col = vim.o.columns - 40,
    },
  },
  keys = {
    { "<leader>uk", ":Screenkey<cr>", desc = "Toggle Screenkey" },
  },
}
