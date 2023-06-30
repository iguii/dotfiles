local status, bufferline = pcall(require, "bufferline")
if not status then
	error("Error loading bufferline" .. bufferline)
	return
end

bufferline.setup()
