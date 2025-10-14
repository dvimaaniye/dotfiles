return {
	"dvimaaniye/vimux",
	config = function()
		vim.keymap.set('n', '<leader>t', '<cmd>VimuxTogglePane<CR>', { desc = "Open runner tmux pane" })
	end
}

-- return {
-- 	dir = '~/projects/work/vimux/',
-- 	dev = true,
-- 	vim.keymap.set('n', '<leader>t', '<cmd>VimuxTogglePane<CR>', { desc = "Open runner tmux pane" })
-- }
