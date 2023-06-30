local status, colorizer = pcall(require, "colorizer")

if not status then
	error("Error loading colorizer" .. colorizer)
	return
end

colorizer.setup()
