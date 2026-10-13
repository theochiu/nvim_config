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

vim.keymap.set('n', '<leader>a', function()
    local ok, blink = pcall(require, 'blink.cmp')
    if not ok then
        vim.notify("blink.cmp is not loaded yet!", vim.log.levels.ERROR)
        return
    end

    -- Toggle buffer-local completion state (default to true if nil)
    if vim.b.completion == nil then
        vim.b.completion = true
    end
    vim.b.completion = not vim.b.completion

    if vim.b.completion then
        vim.notify("Autocomplete: ENABLED", vim.log.levels.INFO)
    else
        -- Immediately hide the completion menu if it's currently open
        pcall(blink.hide)
        vim.notify("Autocomplete: DISABLED", vim.log.levels.WARN)
    end
end, { desc = 'Toggle Autocomplete' })
