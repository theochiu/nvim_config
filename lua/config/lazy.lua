local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    -- bootstrap lazy.nvim
    -- stylua: ignore
    vim.fn.system({ "git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", "--branch=stable",
        lazypath })
end
vim.opt.rtp:prepend(vim.env.LAZY or lazypath)

require("lazy").setup({
    spec = {
        {
            "LazyVim/LazyVim",
            import = "lazyvim.plugins",
            opts = {
                colorscheme = "catppuccin",
            },
        },
        {
            import = "plugins",
        },
        {
            import = "plugins.extras.ui.colorschemes.monokai-pro",
        },
        {
            "EdenEast/nightfox.nvim",
        },
        {
            "nyoom-engineering/oxocarbon.nvim",
        },
         "saghen/blink.cmp",
    version = "1.*", -- Pin to tagged releases to prevent breaking upstream API updates
    dependencies = {
      "rafamadriz/friendly-snippets",
    },
    opts = {
      completion = {
        accept = {
          auto_brackets = { enabled = true },
        },
      },
      keymap = {
        preset = "none",
        ["<Tab>"] = { "select_next", "fallback" },
        ["<S-Tab>"] = { "select_prev", "fallback" },
        -- Custom execution rule to split blink menu and mini.pairs
        ["<CR>"] = {
          function(cmp)
            if cmp.is_visible() then
              return cmp.accept()
            else
              return vim.api.nvim_replace_termcodes(MiniPairs.cr(), true, true, true)
            end
          end,
        },
      },
    },
    config = function(_, opts)
      require("blink.cmp").setup(opts)
    end,



    },
    ui = {
        backdrop = 100,
    },
    defaults = {
        lazy = true,
        version = false, -- always use the latest git commit
        -- version = "*", -- try installing the latest stable version for plugins that support semver
    },
    rocks = { enabled = false, },
    local_spec = true,
    checker = { enabled = true }, -- automatically check for plugin updates
    performance = {
        cache = {
            enabled = true,
            -- disable_events = {},
        },
        rtp = {
            -- disable some rtp plugins
            disabled_plugins = {
                "gzip",
                "tarPlugin",
                "tohtml",
                "tutor",
                "netrwPlugin",
                "zipPlugin",
            },
        },
    },
})
