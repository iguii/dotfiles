-- packer config https://github.com/wbthomason/packer.nvim#quickstart

local ensure_packer = function()
	local fn = vim.fn
	local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
	if fn.empty(fn.glob(install_path)) > 0 then
		fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
		vim.cmd([[packadd packer.nvim]])
		return true
	end
	return false
end

local packer_bootstrap = ensure_packer()

return require("packer").startup(function(use)
	use("wbthomason/packer.nvim")
	-- My plugins here
	--
	-- Lua functions that many plugins use
	use("nvim-lua/plenary.nvim")

	-- vim sessions
	use("rmagatti/auto-session")
	-- Colorschemes
	use("bluz71/vim-nightfly-colors")
	use("folke/tokyonight.nvim") -- Prefered Colorscheme on nvim and alacritty

	-- notifications
	use("rcarriga/nvim-notify")

	-- nvim colorizer
	use("norcalli/nvim-colorizer.lua")

	-- todo comments
	use({
		"folke/todo-comments.nvim",
		requires = "nvim-lua/plenary.nvim",
	})

	-- tabs with styling
	use({ "akinsho/bufferline.nvim", tag = "v3.*", requires = "nvim-tree/nvim-web-devicons" }) -- requires nvim v3.x

	-- dynamic tabs
	use("tpope/vim-sleuth")

	-- closing tabs
	use("ojroques/nvim-bufdel")

	-- tmux and split window navigation
	-- use("alexghergh/nvim-tmux-navigation")
	use("numToStr/Navigator.nvim")

	-- essential plugins
	use("tpope/vim-surround") --for sorroundings and replacements
	use("vim-scripts/ReplaceWithRegister")
	use("karb94/neoscroll.nvim") -- smooth scrolling

	-- commenting with gc
	use("numToStr/Comment.nvim")

	-- file explorer
	use("nvim-tree/nvim-tree.lua")

	-- vscode-like icons
	use("nvim-tree/nvim-web-devicons")

	-- indent lines
	use("lukas-reineke/indent-blankline.nvim")

	-- status line
	use("nvim-lualine/lualine.nvim")

	-- fzf
	use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" })
	use({ "nvim-telescope/telescope.nvim", branch = "0.1.x" })

	-- autocompletion
	use("hrsh7th/nvim-cmp")
	use("hrsh7th/cmp-buffer")
	use("hrsh7th/cmp-path")

	-- snippets
	use("L3MON4D3/LuaSnip")
	use("saadparwaiz1/cmp_luasnip")
	use("rafamadriz/friendly-snippets")

	-- managing and installing lsp servers
	use("williamboman/mason.nvim")
	use("williamboman/mason-lspconfig.nvim")

	-- configuring lsp servers
	use("neovim/nvim-lspconfig")
	-- use("kabouzeid/nvim-lspinstall")
	use("hrsh7th/cmp-nvim-lsp")
	use({ "glepnir/lspsaga.nvim", branch = "main" })
	use("jose-elias-alvarez/typescript.nvim")
	use("onsails/lspkind.nvim")

	-- -- tailwind css
	use("themaxmarchuk/tailwindcss-colors.nvim")

	-- debugging tools
	use("mfussenegger/nvim-dap")
	use({ "rcarriga/nvim-dap-ui", requires = { "mfussenegger/nvim-dap" } })

	-- formatting and linting
	use("jose-elias-alvarez/null-ls.nvim")
	use("jayp0521/mason-null-ls.nvim")

	-- treesitter configuration
	use({
		"nvim-treesitter/nvim-treesitter",
		run = function()
			local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
			ts_update()
		end,
	})

	-- auto closing
	use("windwp/nvim-autopairs") -- autoclose parens, brackets, quotes, etc...
	use({ "windwp/nvim-ts-autotag", after = "nvim-treesitter" }) -- autoclose tag

	-- git integration
	use("lewis6991/gitsigns.nvim") -- show line modifications on left hand side
	use({ "f-person/git-blame.nvim", wants = { "lualine" } }) -- show git blame on the right hand side
	use({
		"kdheepak/lazygit.nvim",
		-- optional for floating window border decoration
		requires = {
			"nvim-lua/plenary.nvim",
		},
	})

	-- dashboard
	-- use("glepnir/dashboard-nvim")

	-- press <tab> to exit from () [] {} "" '' `` and more
	-- This has an issue with copilot when pressing <tab>, in order for this to work run :Copilot disable
	use({
		"abecodes/tabout.nvim",
		config = function()
			require("ignacioillanes.plugins.tabout")
		end,
		wants = { "nvim-treesitter" }, -- or require if not used so far
		after = { "nvim-cmp" }, -- if a completion plugin is using tabs load it before
	})

	------- END OF PLUGINS ---------

	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if packer_bootstrap then
		require("packer").sync()
	end
end)

-- Autocommand that reloads neovim whenever you save this file
-- vim.cmd([[
--  augroup packer_user_config
--    autocmd!
--    autocmd BufWritePost plugins-setup.lua source <afile> | PackerSync
--  augroup end
-- ]])
