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
        {
            "saghen/blink.cmp",
            version = "1.*", -- Pin to tagged releases to prevent breaking upstream API updates
            dependencies = {
                "rafamadriz/friendly-snippets",
            },
            config = function(_, opts)
                -- 1. SMASH LAZY'S ACTIVE INTERCEPTORS IMMEDIATELY
                pcall(vim.keymap.del, "i", "<Tab>")
                pcall(vim.keymap.del, "i", "<S-Tab>")
                pcall(vim.keymap.del, "i", "<CR>")

                -- 2. Run blink's native engine configuration
                require("blink.cmp").setup(opts)
            end,
        }


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
