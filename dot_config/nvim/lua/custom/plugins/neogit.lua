return {
	"NeogitOrg/neogit",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"sindrets/diffview.nvim",
		"folke/snacks.nvim",
	},
	config = function()
		local neogit = require("neogit")

		vim.keymap.set("n", "<leader>gs", function()
			neogit.open({ kind = "replace" })
		end, { desc = "Neo[g]it [S]tatus" })
	end,
}
