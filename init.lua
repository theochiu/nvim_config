-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
-- require("plugins.extras.ui.colorschemes.monokai-pro")

vim.opt.number = true
vim.opt.relativenumber = false
-- vim.cmd([[colorscheme carbonfox]])
vim.cmd([[colorscheme catppuccin-mocha]])
vim.cmd([[ set nornu]])
-- toggle on off
vim.keymap.set("n", "<leader>a", function()
  -- Toggle the buffer-local variable (defaults to true if nil)
  if vim.b.completion == nil then
    vim.b.completion = true
  end
  vim.b.completion = not vim.b.completion

  -- Optional: Print a message so you know it worked
  print("Autocompletion: " .. (vim.b.completion and "On" or "Off"))
end, { desc = "Toggle autocompletion for current buffer" })
