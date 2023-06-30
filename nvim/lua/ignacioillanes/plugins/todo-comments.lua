local status, todo_comments = pcall(require, "todo-comments")
if not status then
	error("Error loading todo-comments" .. todo_comments)
	return
end

todo_comments.setup()
