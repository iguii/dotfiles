-- import gitsigns plugin safely
local setup, gitsigns = pcall(require, "gitsigns")
if not setup then
	error("Error loading gitsigns" .. gitsigns)
	return
end

-- configure/enable gitsigns
gitsigns.setup()
