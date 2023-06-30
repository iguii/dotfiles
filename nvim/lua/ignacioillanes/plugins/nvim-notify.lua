local ok, notify = pcall(require, "notify")
if not ok then
	error("Error loading notify" .. notify)
	return
end

notify.setup({
	background_colour = "#000000",
})

vim.notify = notify
