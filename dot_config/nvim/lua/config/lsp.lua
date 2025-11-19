local M = {}

local servers = {}

local default_capabilities = require("cmp_nvim_lsp").default_capabilities()

M.setup = function()
	for server, config in pairs(servers) do
		config.capabilities = vim.tbl_deep_extend("force", default_capabilities, config.capabilities or {})
		vim.lsp.config(server, config)
		vim.lsp.enable(server)
	end

	vim.diagnostic.config({
		severity_sort = true,
		float = { border = "rounded", source = true },
	})

	vim.keymap.set("n", "<leader>lI", "<cmd>LspInstall<CR>", { desc = "LSP: Install" })
	vim.keymap.set("n", "<leader>li", "<cmd>LspInfo<CR>", { desc = "LSP: Info" })
	vim.keymap.set("n", "<leader>lS", "<cmd>LspStart<CR>", { desc = "LSP: Start" })

	vim.api.nvim_create_autocmd("LspAttach", {
		callback = function(args)
			local client = vim.lsp.get_client_by_id(args.data.client_id)
			if not client then
				return
			end

			if client:supports_method("textDocument/formatting") then
				local conform = require("conform")

				vim.keymap.set("n", "<leader>mp", function()
					conform.format({ bufnr = args.buf })
				end, { desc = "[M]ake [p]retty (format buffer)" })
			end

			local keymap = function(keys, func, desc)
				vim.keymap.set("n", keys, func, { buffer = args.buf, desc = "LSP: " .. desc })
			end

			keymap("<leader>lr", "<cmd>LspRestart<CR>", "Restart")
			keymap("<leader>ls", "<cmd>LspStop<CR>", "Stop")
			keymap("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction")
			keymap("K", vim.lsp.buf.hover, "Hover Documentation")
		end,
	})
end

return M
