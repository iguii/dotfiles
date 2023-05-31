local nav_status, nav = pcall(require, "nvim-tmux-navigation")
if not nav_status then
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
