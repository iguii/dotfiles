local status, navigator = pcall(require, "Navigator")
if not status then
	return
end

navigator.setup()
