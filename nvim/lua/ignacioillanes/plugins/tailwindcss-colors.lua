local status, tailwindcss_colors = pcall(require, "tailwindcss-colors")
if not status then
	error("Error loading tailwindcss_colors" .. tailwindcss_colors)
	return
end

-- WARNING: this has a reference inside lspconfig
tailwindcss_colors.setup({})
