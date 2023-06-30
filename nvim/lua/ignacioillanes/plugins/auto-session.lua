local status, auto_session = pcall(require, "auto-session")
if not status then
	error("Error loading auto-session" .. auto_session)
	return
end

auto_session.setup({
	log_level = "error",
	auto_session_enabled = true,
	auto_save_enabled = true,
	auto_restore_enabled = true,
	auto_session_suppress_dirs = {
		"~/",
		"~/Downloads",
		"/",
	},
})
