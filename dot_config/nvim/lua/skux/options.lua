-- See `:help vim.o`

-- Set highlight on search
vim.o.hlsearch = true

-- Make line numbers default
vim.wo.number = true
-- Enable relative line numbers
vim.wo.relativenumber = true

-- Enable mouse mode
vim.o.mouse = 'a'

-- Sync clipboard between OS and Neovim.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
vim.o.clipboard = 'unnamedplus'

-- Enable break indent
vim.o.breakindent = true

-- Save undo history
vim.o.undofile = true

-- Case-insensitive searching UNLESS \C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect'

-- Keep signcolumn on by default
vim.wo.signcolumn = 'yes'

-- appearance
-- NOTE: You should make sure your terminal supports this
vim.o.termguicolors = true
vim.o.background = "dark"
vim.o.signcolumn = "yes"

-- tabs and indentation
vim.opt.expandtab = true
vim.opt.autoindent = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4

-- split windows
vim.o.splitright = true
vim.o.splitbelow = true

vim.opt.iskeyword:append("-")

-- Decrease update time
vim.o.updatetime = 250
vim.o.timeoutlen = 300
