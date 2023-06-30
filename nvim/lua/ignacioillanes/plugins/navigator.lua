local status, navigator = pcall(require, "Navigator")
if not status then
	error("Error loading Navigator" .. navigator)
	return
end

navigator.setup()
