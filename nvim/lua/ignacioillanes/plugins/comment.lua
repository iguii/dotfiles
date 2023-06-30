local setup, comment = pcall(require, "Comment")

if not setup then
	error("Error loading Comment" .. comment)
	return
end

comment.setup()
