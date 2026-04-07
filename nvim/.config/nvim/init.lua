-- Modern Neovim Options
vim.opt.number = true         -- Show line numbers
vim.opt.relativenumber = true -- Great for jumping around with counts
vim.opt.shiftwidth = 4        -- Standard C++ indentation
vim.opt.expandtab = true      -- Use spaces instead of tabs
vim.opt.termguicolors = true  -- Better colors for your Kitty rice

-- 1. Setup Built-in Package Manager (vim.pack)
-- This allows you to add plugins directly from GitHub
vim.pack.add({ src = 'https://github.com/neovim/nvim-lspconfig' })
vim.pack.add({ src = 'https://github.com/nvim-treesitter/nvim-treesitter' })
vim.pack.add({ src = 'https://github.com/catppuccin/nvim', name = 'catppuccin' })
-- Theme: Catppuccin Mocha (Dark, smooth, and easy on the eyes) - wtf are you saying copilot, I just like it
vim.cmd.colorscheme "catppuccin-mocha"
-- 2. Setup Treesitter (High-performance Syntax Highlighting)
require('nvim-treesitter.configs').setup({
    ensure_installed = { "c", "cpp", "lua" },
    highlight = { enable = true },
})

-- 3. Native LSP for C++ (clangd)
local lspconfig = require('lspconfig')
lspconfig.clangd.setup({
    cmd = { "clangd", "--background-index", "--clang-tidy" },
})

-- Performance: Format on save for those clean one-liner if statements
vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = { "*.c", "*.cpp", "*.h" },
    callback = function() vim.lsp.buf.format() end,
})