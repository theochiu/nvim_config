-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
-- require("plugins.extras.ui.colorschemes.monokai-pro")

vim.opt.number = true
vim.opt.relativenumber = false
-- vim.cmd([[colorscheme carbonfox]])
vim.cmd([[colorscheme catppuccin-mocha]])
vim.cmd([[ set nornu]])

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

-- In your init.lua or lua/config/keymaps.lua
vim.keymap.set('n', '<leader>a', function()
  local ok, cmp = pcall(require, 'cmp')
  if not ok then
    vim.notify("nvim-cmp is not loaded yet!", vim.log.levels.ERROR)
    return
  end

  local current_config = cmp.get_config()
  if current_config.completion.autocomplete == false then
    cmp.setup({
      completion = {
        autocomplete = { cmp.TriggerEvent.TextChanged }
      }
    })
    vim.notify("Autocomplete: ENABLED", vim.log.levels.INFO)
  else
    cmp.setup({
      completion = {
        autocomplete = false
      }
    })
    vim.notify("Autocomplete: DISABLED", vim.log.levels.WARN)
  end
end, { desc = 'Toggle Autocomplete' })
