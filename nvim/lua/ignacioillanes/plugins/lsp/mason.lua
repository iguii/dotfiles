local mason_status, mason = pcall(require, "mason")
if not mason_status then
	error("Error loading mason" .. mason)
	return
end

local mason_lspconfig_status, mason_lspconfig = pcall(require, "mason-lspconfig")
if not mason_lspconfig_status then
	error("Error loading mason-lspconfig" .. mason_lspconfig)
	return
end

local mason_null_ls_status, mason_null_ls = pcall(require, "mason-null-ls")
if not mason_null_ls_status then
	error("Error loading mason-null-ls" .. mason_null_ls)
	return
end

mason.setup()

mason_lspconfig.setup({
	ensure_installed = {
		"lua_ls", -- Lua
		"tsserver", -- TypeScript
		"html", -- HTML
		"cssls", -- CSS
		"tailwindcss", -- TailwindCSS
		"gopls", -- Go
	},
})

mason_null_ls.setup({
	ensure_installed = {
		"prettier",
		"stylua",
		"eslint_d",
	},
})
