return {
	{
		"stevearc/conform.nvim",
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			local conform = require("conform")

			conform.setup({
				formatters_by_ft = {
					c = { "clang-format" },
					cpp = { "clang-format" },
					lua = { "stylua" },
					python = { "black" },
					css = { "prettierd", "prettier", stop_after_first = true },
					javascript = { "prettierd", "prettier", stop_after_first = true },
					typescript = { "prettierd", "prettier", stop_after_first = true },
					javascriptreact = { "prettierd", "prettier", stop_after_first = true },
					typescriptreact = { "prettierd", "prettier", stop_after_first = true },
					astro = { "prettierd", "prettier", stop_after_first = true },
					json = { "prettierd", "prettier", stop_after_first = true },
				},
				format_on_save = {
					lsp_format = "fallback",
					timeout_ms = 500,
				},
			})
		end,
	},
}
