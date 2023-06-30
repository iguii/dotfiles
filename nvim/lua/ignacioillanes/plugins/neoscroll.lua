local status, neoscroll = pcall(require, "neoscroll")

if not status then
	error("Error loading neoscroll: " .. neoscroll)
	return
end

neoscroll.setup()
