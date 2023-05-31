local home = os.getenv("HOME")

local dashboard_status, db = pcall(require, "dashboard")
if not dashboard_status then
	return
end

vim.g.dashboard_default_executive = "telescope"

db.preview_command = "cat | lolcat -F 0.3"

db.preview_file_path = home .. "/.config/nvim/static/image.cat"
db.preview_file_height = 36
db.preview_file_width = 70
db.custom_center = {
	{
		icon = "  ",
		desc = "Recently latest session                  ",
		shortcut = "SPC s l",
		action = "SessionLoad",
	},
	{
		icon = "  ",
		desc = "Recently opened files                   ",
		action = "DashboardFindHistory",
		shortcut = "SPC f h",
	},
	{
		icon = "  ",
		desc = "Find  File                              ",
		action = "Telescope find_files find_command=rg,--hidden,--files",
		shortcut = "SPC f f",
	},
	{
		icon = "  ",
		desc = "File Browser                            ",
		action = "Telescope file_browser",
		shortcut = "SPC f b",
	},
	{
		icon = "  ",
		desc = "Find  word                              ",
		action = "Telescope live_grep",
		shortcut = "SPC f w",
	},
	{
		icon = "  ",
		desc = "Open Personal dotfiles                  ",
		action = "Telescope dotfiles path=" .. home .. "/.dotfiles",
		shortcut = "SPC f d",
	},
}
