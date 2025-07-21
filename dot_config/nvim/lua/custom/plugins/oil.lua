return {
	"stevearc/oil.nvim",
	dependencies = { { "echasnovski/mini.icons", opts = {} } },
	config = function()
		require("oil").setup({
			default_file_explorer = true,
			columns = {
				"icon",
			},
			view_options = {
				show_hidden = true,
			},
			float = {
				padding = 2,
				max_width = 0.7,
				max_height = 0.8,
			},
			keymaps = {
				["q"] = "actions.close",
			},
		})
		vim.keymap.set("n", "-", "<cmd>Oil<CR>", { desc = "Open parent directory" })
		-- vim.g.loaded_netrw = 1
		-- vim.g.loaded_netrwPlugin = 1
	end,
}
