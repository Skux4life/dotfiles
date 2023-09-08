local keymap = vim.keymap

local opts = { expr = true, silent = true }

keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Remap for dealing with word wrap
keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Remap ESC key in different modes
keymap.set("i", "jk", "<ESC>")
keymap.set("v", "jk", "<ESC>")
keymap.set("c", "jk", "<ESC>")

-- clear highlights
keymap.set("n", "<leader>nh", ":nohl<CR>")

-- delete character but don't copy into register
keymap.set("n", "x", '"_x')

-- increment/decrement numbers
keymap.set("n", "<leader>+", "<C-a>")
keymap.set("n", "<leader>-", "C-x")

-- format
keymap.set("n", "<leader>f", vim.lsp.buf.format)

-- replace current word
keymap.set('n', '<leader>s', [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- indent and outdent lines quickly
keymap.set('n', '<TAB>', '>>', opts)
keymap.set('n', '<S-TAB>', '<<', opts)

-- greatest remap ever
keymap.set("x", "<leader>p", [["_dP]])

-- next greatest remap ever : asbjornHaland
keymap.set({"n", "v"}, "<leader>y", [["+y]])
keymap.set("n", "<leader>Y", [["+Y]])

-- open file explorer
keymap.set("n", "<leader>tt", ":Rexplore<CR>")
