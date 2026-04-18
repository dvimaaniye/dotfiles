local M = {}

-- el = express-line
local builtin = require("el.builtin")
local extensions = require("el.extensions")
local subscribe = require("el.subscribe")
local sections = require("el.sections")

vim.opt.laststatus = 3

M.setup = function()
	require("el").setup({
		generator = function()
			local segments = {}

			table.insert(segments, extensions.mode)
			table.insert(segments, " ")
			table.insert(
				segments,
				subscribe.buf_autocmd("el-git-branch", "BufEnter", function(win, buf)
					local branch = extensions.git_branch(win, buf)
					if branch then
						return branch
					end
				end)
			)
			table.insert(
				segments,
				subscribe.buf_autocmd("el-git-changes", "BufWritePost", function(win, buf)
					local changes = extensions.git_changes(win, buf)
					if changes then
						return changes
					end
				end)
			)
			table.insert(segments, sections.split)
			table.insert(segments, function(window, buffer)
				if buffer.name == "" then
					return builtin.file(window, buffer)
				end

				if buffer.filetype == "oil" then
					return ""
				end

				local relative_buffer_name = vim.fn.fnamemodify(buffer.name, ":.") or buffer.name
				if relative_buffer_name:len() > 50 then
					return builtin.make_responsive_file(0, 120, true)(window, buffer)
				end

				return relative_buffer_name
			end)
			table.insert(segments, builtin.modified)
			table.insert(segments, sections.split)
			table.insert(segments, builtin.filetype)

			table.insert(segments, "[")
			table.insert(segments, builtin.line_number)
			table.insert(segments, ":")
			table.insert(segments, builtin.virtual_column)
			table.insert(segments, "|")
			table.insert(segments, builtin.number_of_lines)
			table.insert(segments, ":")
			table.insert(segments, function()
				return vim.fn.virtcol("$") - 1
			end)
			table.insert(segments, "]")

			return segments
		end,
	})
end

return M
