local nav_status, nav = pcall(require, "nvim-tmux-navigation")
if not nav_status then
	error("Error loading nvim-tmux-navigation" .. nav)
	return
end

-- remaps using colemak
nav.setup({
	keybindings = {
		left = "<M-h>",
		down = "<M-n>",
		up = "<M-e>",
		right = "<M-i>",
	},
})
