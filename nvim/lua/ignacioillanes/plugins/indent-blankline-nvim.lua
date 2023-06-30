local status, indent = pcall(require, "indent_blankline")
if not status then
	error("Error loading indent-blankline" .. indent)
	return
end

indent.setup({
	show_current_context = true,
	show_current_context_start = true,
})
