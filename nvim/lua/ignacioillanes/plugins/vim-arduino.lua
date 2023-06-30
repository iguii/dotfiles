local status, arduino = pcall(require, "arduino")
if not status then
	error("Error loading arduino" .. arduino)
	return
end

arduino.setup()
