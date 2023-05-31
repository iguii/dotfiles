local status, _ = pcall(vim.cmd, "colorscheme nightfly")

if not status then
	print("Colorscheme not found!")
	return
end

vim.g.nightflyUnderlineMatchParen = true

vim.cmd("highlight Normal guibg=NONE ctermbg=NONE")
