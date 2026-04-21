-- Modern Neovim Options
vim.opt.number = true         -- Show line numbers
vim.opt.relativenumber = true -- Great for jumping around with counts
vim.opt.shiftwidth = 4        -- Standard C++ indentation
vim.opt.expandtab = true      -- Use spaces instead of tabs
vim.opt.termguicolors = true  -- Better colors for your Kitty rice

-- 1. Setup Built-in Package Manager (vim.pack)
-- This allows you to add plugins directly from GitHub
vim.pack.add({
    { src = 'https://github.com/neovim/nvim-lspconfig' },
    { src = 'https://github.com/nvim-treesitter/nvim-treesitter' },
    { src = 'https://github.com/catppuccin/nvim', name = 'catppuccin' },
    { src = 'https://github.com/nvim-tree/nvim-web-devicons' },
    { src = 'https://github.com/nvim-tree/nvim-tree.lua' },
    { src = 'https://github.com/akinsho/bufferline.nvim' },
    { src = 'https://github.com/lewis6991/gitsigns.nvim' }
})
-- Theme: Catppuccin Mocha (Dark, smooth, and easy on the eyes) - wtf are you saying copilot, I just like it
vim.cmd.colorscheme "catppuccin-mocha"
-- 2. Setup Treesitter (High-performance Syntax Highlighting)
local ts_status_ok, treesitter = pcall(require, 'nvim-treesitter.configs')
if ts_status_ok then
    treesitter.setup({
        ensure_installed = { "c", "cpp", "lua" },
        highlight = { enable = true },
    })
end

-- 3. Native LSP for C++ (clangd)
vim.lsp.config('clangd', {
    cmd = { "clangd", "--background-index", "--clang-tidy" },
})

-- Enable the server
vim.lsp.enable('clangd')

-- 4. File Explorer (Nvim-Tree)
-- Disables netrw (Neovim's default explorer) to prevent conflicts
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

local ok_tree, nvim_tree = pcall(require, 'nvim-tree')
if ok_tree then nvim_tree.setup({ view = { width = 30 } }) end

-- Toggle explorer with Ctrl+b
vim.keymap.set('n', '<C-b>', ':NvimTreeToggle<CR>', { silent = true })

-- 5. Tabs & Navigation (Bufferline)
-- Requires termguicolors to be true, which you already have set
local ok_bl, bufferline = pcall(require, 'bufferline')
if ok_bl then bufferline.setup({ options = { numbers = "ordinal", diagnostics = "nvim_lsp" } }) end

-- Map Ctrl + 1 through 9 to navigate tabs
for i = 1, 9 do
    vim.keymap.set('n', '<C-' .. i .. '>', '<Cmd>BufferLineGoToBuffer ' .. i .. '<CR>', { silent = true })
end

-- 6. Git Integration (Gitsigns)
-- Adds git diff markers to the gutter and blame info
local ok_git, gitsigns = pcall(require, 'gitsigns')
if ok_git then gitsigns.setup() end
-- Performance: Format on save for those clean one-liner if statements
vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = { "*.c", "*.cpp", "*.h" },
    callback = function() vim.lsp.buf.format() end,
})
