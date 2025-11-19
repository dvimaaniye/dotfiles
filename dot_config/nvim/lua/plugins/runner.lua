return {
	"MarcHamamji/runner.nvim",
	enabled = false,
	dependencies = {
		"nvim-telescope/telescope.nvim",
		"nvim-lua/plenary.nvim",
	},
	config = function()
		require("runner").setup({
			position = "bottom",
		})
		vim.keymap.set("n", "<leader>r", "<cmd>Runner<CR>", { desc = "Run code with runner.nvim" })
	end,
}
