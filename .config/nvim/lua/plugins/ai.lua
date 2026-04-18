return {
	{
		"zbirenbaum/copilot.lua",
		cmd = "Copilot",
		event = "InsertEnter",
		config = function()
			require("copilot").setup({
				suggestion = {
					auto_trigger = false,
					keymap = {
						accept = "<C-a>",
						next = "<C-;>",
						prev = "<C-,>",
						dismiss = "<C-e>",
					},
				},
			})
		end,
	},
}
