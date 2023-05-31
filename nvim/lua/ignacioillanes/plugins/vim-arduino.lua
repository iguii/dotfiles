local status, arduino = pcall(require, "arduino")
if not status then
	return
end

arduino.setup()
