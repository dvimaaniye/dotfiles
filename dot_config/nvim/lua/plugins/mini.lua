return {
	"nvim-mini/mini.nvim",
	version = false,
	config = function()
		require("mini.bracketed").setup({
			treesitter = { suffix = "" },
		})
	end,
}
