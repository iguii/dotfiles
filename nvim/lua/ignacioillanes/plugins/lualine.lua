local status, lualine = pcall(require, "lualine")
if not status then
	return
end

local git_blame_status, git_blame = pcall(require, "gitblame")
if not git_blame_status then
	return
end
vim.g.gitblame_display_virtual_text = 0 -- disable virtual text

lualine.setup({
	sections = {
		lualine_a = { "mode" },
		lualine_b = { "branch" },
		lualine_c = {
			"filename",
			{
				git_blame.get_current_blame_text,
				cond = git_blame.is_blame_text_available,
			},
		},
		lualine_x = { "encoding", "fileformat", "filetype" },
		lualine_y = { "progress", "ObsessionStatus" },
		lualine_z = { "location" },
	},
})
