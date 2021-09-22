local g = vim.g
local key = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- Map leader to space
g.mapleader = " "

-- Window Control
key("n", "<leader>w", "<C-w>", {})

-- Quit window
key("n", "<C-q>", ":q<CR>", {})

-- Switch tabs
key("n", "<Tab>", ":tabnext<CR>", opts)

-- Close Buffer (like really really)
key("n", "bc", ":bd!<CR>", opts)

-- Save file
key("n", "<C-s>", ":w<CR>", opts)

-- Moving text
key("n", "<leader>k", ":m .-2<CR>==", opts) -- up
key("n", "<leader>j", ":m .+1<CR>==", opts) -- down

-- Convert text to uppercase
key("v", "gU", "gVU", opts)
-- Convert text to lowercase
key("v", "gu", "gVu", opts)

-- Open Nvim-Tree
key("n", "<A-f>", ":NvimTreeToggle<CR>", opts)
-- Refresh Nvim-Tree
key("n", "<A-r>", ":NvimTreeRefresh<CR>", opts)

-- Comment Line
key("n", "gcc", "<Plug>kommentary_line_default", opts)
-- Comment Visual
key("v", "gc", "<Plug>kommentary_visual_default", opts)

-- Fix Whitespace
key("n", "<Leader>fw", ":FixWhitespace<CR>", opts)

-- Escape insert mode
key("i", "jj", "<Esc>", {})
key("i", "jk", "<Esc>", {})

-- Escape insert mode in Terminal mode
key("t", "<Esc>", "<C-\\><C-n>", {})

-- Kill Highlighted Text
key("n", "<A-h>", ":noh<CR>", opts)

-- Open Terminal Tab
-- map('n', '<C-\\>', ':tabnew<CR>:terminal<CR>i', {})

-- Toggle Term
key("n", "<A-`>", ":ToggleTerm<CR>", opts)

-- Open Diagnostics
key("n", "<Leader>d", ":TroubleToggle<CR>", opts)

-- Open Markdown Preview
key("n", "<Leader>p", ":MarkdownPreviewToggle<CR>", opts)

-- Toggle Table Mode
key("n", "TM", ":TableModeToggle<CR>", opts)

-- Hop line
key("n", "S", ":HopLine<CR>", opts)

-- Hop char
key("n", "s", ":HopChar1<CR>", opts)

-- Telescope

-- summon telescope builtins
key("n", "<Leader>.", ":Telescope builtin<CR>", opts)
-- find buffer
key("n", ";", ":Telescope buffers<CR>", opts)
-- find in current buffer
key("n", "<Leader>/", ":Telescope current_buffer_fuzzy_find<CR>", opts)
-- git files
key("n", "<Leader>g", ":Telescope git_files<CR>", opts)
-- ripgrep through dir
key("n", "<Leader>rg", ":Telescope live_grep<CR>", opts)
-- lsp definitions
key("n", "gd", ":Telescope lsp_definitions<CR>", opts)
-- lsp references
key("n", "gr", ":Telescope lsp_references<CR>", opts)
-- code actions
key("n", "ga", ":Telescope lsp_code_actions<CR>", opts)

-- LSP
-- rename
key("n", "gR", ":Lspsaga rename<CR>", opts)
-- hover doc
key("n", "K", ":Lspsaga hover_doc<CR>", opts)
-- signature help
key("n", "<C-k>", ":lua vim.lsp.buf.signature_help()<CR>", opts)
-- buffer formatting
key("n", "gf", ":lua vim.lsp.buf.formatting()<CR>", opts)
