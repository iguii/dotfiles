-- Set transparent background
-- vim.cmd([[
--   autocmd hi normal guibg=000000
-- ]])

-- On exit changes cursor from vertical bar to vertical line
vim.cmd([[
  augroup RestoreCursorShapeOnExit
    autocmd!
    autocmd VimLeave * set guicursor=a:ver25-iCursor
  augroup END
]])

-- Core config files
require("ignacioillanes.plugins-setup")
require("ignacioillanes.core.options")
require("ignacioillanes.core.keymaps")
require("ignacioillanes.core.colorscheme")
require("ignacioillanes.core.commands")

-- Plugins
-- require("ignacioillanes.plugins.nvim-tmux-navigation")
require("ignacioillanes.plugins.navigator")
require("ignacioillanes.plugins.comment")
require("ignacioillanes.plugins.nvim-tree")
require("ignacioillanes.plugins.lualine")
require("ignacioillanes.plugins.indent-blankline-nvim")
require("ignacioillanes.plugins.nvim-notify")
require("ignacioillanes.plugins.nvim-colorizer")
require("ignacioillanes.plugins.todo-comments")
require("ignacioillanes.plugins.telescope")
require("ignacioillanes.plugins.nvim-cmp")
require("ignacioillanes.plugins.lsp.mason")
require("ignacioillanes.plugins.lsp.lspsaga")
require("ignacioillanes.plugins.lsp.lspconfig")
require("ignacioillanes.plugins.lsp.null-ls")
require("ignacioillanes.plugins.autopairs")
require("ignacioillanes.plugins.treesitter")
require("ignacioillanes.plugins.gitsigns")
require("ignacioillanes.plugins.dashboard-nvim")
require("ignacioillanes.plugins.bufferline")
require("ignacioillanes.plugins.auto-session")
require("ignacioillanes.plugins.debug.dap-ui")

-- require("ignacioillanes.plugins.vim-arduino")
