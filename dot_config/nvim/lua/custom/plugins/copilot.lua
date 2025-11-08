return {
	"zbirenbaum/copilot.lua",
	enabled = true,
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
			-- nes = {
			-- 	enabled = true,  -- Enable the NES functionality
			-- 	auto_trigger = true, -- Automatically trigger suggestions
			-- 	keymap = {
			-- 		accept = "<C-S-a>",
			-- 		dismiss = "<C-S-e>",
			-- 	},
			-- }
		})
	end,
}
