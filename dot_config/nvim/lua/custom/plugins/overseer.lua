return {
	'stevearc/overseer.nvim',
	opts = {
		task_list = {
			direction = 'right',
		}
	},
	vim.keymap.set('n', '<leader>T', '<cmd>OverseerToggle!<CR>', { desc = 'Toggle tasks list' }),
	vim.keymap.set('n', '<leader>r', '<cmd>OverseerRun<CR>', { desc = 'Run a command from a list' }),
}
