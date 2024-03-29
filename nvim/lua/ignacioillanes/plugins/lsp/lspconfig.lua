-- import lspconfig plugin safely
local lspconfig_status, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status then
	error("Error loading lspconfig" .. lspconfig)
	return
end

-- import cmp-nvim-lsp plugin safely
local cmp_nvim_lsp_status, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not cmp_nvim_lsp_status then
	error("Error loading cmp_nvim_lsp" .. cmp_nvim_lsp)
	return
end

-- import typescript plugin safely
local typescript_setup, typescript = pcall(require, "typescript")
if not typescript_setup then
	error("Error loading typescript" .. typescript)
	return
end

-- import tailwindcss-colors plugin safely
local tailwindcss_colors_setup, tailwindcss_colors = pcall(require, "tailwindcss-colors")
if not tailwindcss_colors_setup then
	error("Error loading tailwindcss-colors" .. tailwindcss_colors)
	return
end

-- -- import java plugin safely
-- local jdtls_setup, jdtls = pcall(require, "jdtls")
-- if not jdtls_setup then
-- 	print("jdtls not found")
-- 	return
-- end

local keymap = vim.keymap -- for conciseness

-- enable keybinds only for when lsp server available
local on_attach = function(client, bufnr)
	-- keybind options
	local opts = { noremap = true, silent = true, buffer = bufnr }

	-- set keybinds
	keymap.set("n", "gf", "<cmd>Lspsaga lsp_finder<CR>", opts) -- show definition, references
	keymap.set("n", "gD", "<Cmd>lua vim.lsp.buf.declaration()<CR>", opts) -- got to declaration
	keymap.set("n", "gd", "<cmd>Lspsaga peek_definition<CR>", opts) -- see definition and make edits in window
	keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts) -- go to implementation
	keymap.set("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>", opts) -- see available code actions
	keymap.set("n", "<leader>rn", "<cmd>Lspsaga rename<CR>", opts) -- smart rename
	keymap.set("n", "<leader>D", "<cmd>Lspsaga show_line_diagnostics<CR>", opts) -- show  diagnostics for line
	keymap.set("n", "<leader>d", "<cmd>Lspsaga show_cursor_diagnostics<CR>", opts) -- show diagnostics for cursor
	keymap.set("n", "[d", "<cmd>Lspsaga diagnostic_jump_prev<CR>", opts) -- jump to previous diagnostic in buffer
	keymap.set("n", "]d", "<cmd>Lspsaga diagnostic_jump_next<CR>", opts) -- jump to next diagnostic in buffer
	keymap.set("n", "K", "<cmd>Lspsaga hover_doc<CR>", opts) -- show documentation for what is under cursor
	keymap.set("n", "<leader>o", "<cmd>LSoutlineToggle<CR>", opts) -- see outline on right hand side

	-- typescript specific keymaps (e.g. rename file and update imports)
	if client.name == "tsserver" then
		keymap.set("n", "<leader>rf", ":TypescriptRenameFile<CR>") -- rename file and update imports
		keymap.set("n", "<leader>oi", ":TypescriptOrganizeImports<CR>") -- organize imports (not in youtube nvim video)
		keymap.set("n", "<leader>ru", ":TypescriptRemoveUnused<CR>") -- remove unused variables (not in youtube nvim video)
	end

	-- tailwindcss-colors specific config
	if client.name == "tailwindcss" then
		require("tailwindcss-colors").buf_attach(bufnr)
	end
end

-- used to enable autocompletion (assign to every lsp server config)
local capabilities = cmp_nvim_lsp.default_capabilities()
capabilities.offsetEncoding = { "utf-16" }

-- configure c++ server
-- lspconfig["clangd"].setup({
-- 	capabilities = capabilities,
-- 	on_attach = on_attach,
-- })

lspconfig.ccls.setup({
	capabilities = capabilities,
	on_attach = on_attach,
	init_options = {
		compilationDatabaseDirectory = "build",
		index = {
			threads = 0,
		},
		clang = {
			excludeArgs = { "-frounding-math" },
		},
	},
})

-- configure html server
lspconfig["html"].setup({
	capabilities = capabilities,
	on_attach = on_attach,
})

-- configure typescript server
typescript.setup({
	server = {
		capabilities = capabilities,
		on_attach = on_attach,
	},
})

-- configure css server
lspconfig.cssls.setup({
	capabilities = capabilities,
	on_attach = on_attach,
})

-- configure tailwindcss server
lspconfig.tailwindcss.setup({
	capabilities = capabilities,
	on_attach = on_attach,
})

-- configure lua server (with special settings)
lspconfig["lua_ls"].setup({
	capabilities = capabilities,
	on_attach = on_attach,
	settings = { -- custom settings for lua
		Lua = {
			-- make the language server recognize "vim" global
			diagnostics = {
				globals = { "vim" },
			},
			workspace = {
				-- make language server aware of runtime files
				library = {
					[vim.fn.expand("$VIMRUNTIME/lua")] = true,
					[vim.fn.stdpath("config") .. "/lua"] = true,
				},
			},
		},
	},
})

-- configure emmet server
lspconfig["emmet_ls"].setup({
	capabilities = capabilities,
	on_attach = on_attach,
})

-- configure python server
lspconfig["pyre"].setup({
	capabilities = capabilities,
	on_attach = on_attach,
})

-- configure go server
lspconfig["gopls"].setup({
	capabilities = capabilities,
	on_attach = on_attach,
	cmd = { "gopls" },
	filetypes = { "go", "gomod", "gowork", "gotmpl" },
	root_dir = lspconfig.util.root_pattern("go.work", "go.mod", ".git"),
	settings = {
		gopls = {
			completeUnimported = true,
			usePlaceholders = true,
			analyses = {
				unusedparams = true,
			},
		},
	},
})

-- -- configure arduino server
-- lspconfig["arduino_language_server"].setup({
-- 	capabilities = capabilities,
-- 	on_attach = on_attach,
-- })

-- configure jdtls server
-- lspconfig["jdtls"].setup({
-- 	capabilities = capabilities,
-- 	on_attach = on_attach,
-- 	cmd = { "jdtls" },
-- })

-- -- configure jdtls server
-- jdtls.start_or_attach({
-- 	cmd = { "/usr/local/bin/jdtls" },
-- 	capabilities = capabilities,
-- 	root_dir = vim.fs.dirname(vim.fs.find({ "gradlew", ".git", "mvnw" }, { upward = true })[1]),
-- })

-- configure yaml-language-server
lspconfig.yamlls.setup({
	capabilities = capabilities,
	on_attach = on_attach,
})
