return {
	"folke/noice.nvim",
	event = "VeryLazy",
	opts = {
		views = {
			cmdline_popup = {
				position = {
					row = "10%",
					col = "50%",
				},
			},
		},
		-- messages = {
		-- 	view = "messages",
		-- },
		routes = {
			{
				view = "mini",
				filter = { event = "msg_showmode" },
			},
		},
		lsp = {
			hover = {
				silent = true,
			},
			message = {
				view = "mini",
			},
		},
		-- signature = {
		-- 	enabled = true,
		-- 	auto_open = {
		-- 		enabled = true,
		-- 		trigger = true,
		-- 		luasnip = true,
		-- 		throttle = 50,
		-- 	},
		-- },
		presets = {
			command_palette = true,
			inc_rename = true,
			lsp_doc_border = true,
		},
	},
	dependencies = {
		"MunifTanjim/nui.nvim",
		"rcarriga/nvim-notify",
	},
	config = function(_, opts)
		require("noice").setup(opts)

		local noicelsp = require("noice.lsp")
		vim.keymap.set({ "n", "i", "s" }, "<c-f>", function()
			if not noicelsp.scroll(4) then
				return "<c-f>"
			end
		end, { silent = true, expr = true })

		vim.keymap.set({ "n", "i", "s" }, "<c-b>", function()
			if not noicelsp.scroll(-4) then
				return "<c-b>"
			end
		end, { silent = true, expr = true })
	end,
}
