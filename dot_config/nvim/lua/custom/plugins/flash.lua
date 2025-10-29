return {
	"folke/flash.nvim",
	event = "VeryLazy",
	enabled = false,
	---@type Flash.Config
	opts = {
		modes = {
			char = {
				jump_labels = true,
			},
		},
	},
}
