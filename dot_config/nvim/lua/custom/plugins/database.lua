return {
	{
		"tpope/vim-dadbod",
	},
	{
		"kristijanhusak/vim-dadbod-ui",
		config = function()
			vim.keymap.set("n", "<leader>D", "<cmd>DBUIToggle<CR>", { desc = "DB UI Toggle" })
		end,
	},
	{ "kristijanhusak/vim-dadbod-completion", ft = { "sql", "mysql", "plsql" }, lazy = true },
}
