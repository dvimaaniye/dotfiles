return {
	"stevearc/oil.nvim",
	dependencies = { { "nvim-mini/mini.icons", opts = {} } },
	-- dependencies = { { "nvim-tree/nvim-web-devicons", opts = {} } },
	config = function()
		require("oil").setup({
			default_file_explorer = true,
			delete_to_trash = true,
			skip_confirm_for_simple_edits = true,
			columns = {
				"icon",
			},
			win_options = {
				signcolumn = "yes:2",
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
				["<C-h>"] = false,
				["<C-l>"] = false,
				["<C-k>"] = false,
				["<C-j>"] = false,
				["<C-r>"] = "actions.refresh",
				["q"] = "actions.close",
			},
		})

		vim.keymap.set("n", "-", "<cmd>Oil<CR>", { desc = "Open parent directory" })

		vim.api.nvim_create_autocmd("User", {
			pattern = "OilActionsPost",
			callback = function(event)
				if event.data.actions.type == "move" then
					Snacks.rename.on_rename_file(event.data.actions.src_url, event.data.actions.dest_url)
				end
			end,
		})
		-- vim.g.loaded_netrw = 1
		-- vim.g.loaded_netrwPlugin = 1
	end,
}
