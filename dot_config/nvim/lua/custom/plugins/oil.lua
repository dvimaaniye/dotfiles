return {
	{
		"stevearc/oil.nvim",
		opts = {
			default_file_explorer = true,
		},
		dependencies = { { "echasnovski/mini.icons", opts = {} } },
		-- dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
		  require("oil").setup({
			columns = {
			  "icon",
			},
			view_options = {
			  show_hidden = true,
			},
		  })
		  vim.keymap.set("n", "-", "<cmd>Oil<CR>", { desc = "Open parent directory" })
		  vim.g.loaded_netrw = 1
		  vim.g.loaded_netrwPlugin = 1
		end,
	  },
	}
