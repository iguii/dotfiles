vim.g.mapleader = " "

local keymap = vim.keymap
local opts = { noremap = true, silent = true }

-- general keymaps
-- remap ESC key
keymap.set("i", "tn", "<ESC>") -- remap T + N to ESC of insert mode
keymap.set("v", "tn", "<ESC>") -- remap T + N to ESC of visual mode

keymap.set("n", "<leader>kh", ":nohl<CR>")

keymap.set("n", "x", '"_x')

-- window management
keymap.set("n", "<leader>sv", "<C-w>v") -- split window vertically
keymap.set("n", "<leader>sh", "<C-w>s") -- split window horizontally
keymap.set("n", "<leader>se", "<C-w>=") -- make split windows equal width & height
keymap.set("n", "<leader>sx", ":close<CR>") -- close current split window

-- buffer management. Uses buffeline.nvim
keymap.set("n", "<leader>tn", "<cmd>BufferLineCycleNext<CR>", opts) -- next buffer
keymap.set("n", "<leader>tp", "<cmd>BufferLineCyclePrev<CR>", opts) -- previous buffer
-- closing buffers. Uses nvim-BufDel
keymap.set("n", "<leader>tc", "<cmd>BufDel<CR>")

-- keymap.set("n", "<C-h>", "<cmd>NavigatorLeft<CR>")
keymap.set("n", "<C-n>", "<cmd>NavigatorDown<CR>")
keymap.set("n", "<C-e>", "<cmd>NavigatorUp<CR>")
keymap.set("n", "<C-i>", "<cmd>NavigatorRight<CR>")

-- NvimTree
keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>")

-- telescope
keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>") -- find files within current working directory, respects .gitignore
keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>") -- search for string within current working directory
keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>") -- find string under cursor in current working directory
keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>") -- list open buffers in current neovim instance
keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>") -- list available help tags

-- lazygit.nvim
keymap.set("n", "<leader>gg", "<cmd>LazyGit<cr>")
