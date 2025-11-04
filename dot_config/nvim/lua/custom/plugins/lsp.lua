return {
	"neovim/nvim-lspconfig",
	config = function()
		local servers = {
			cmake = {},
			clangd = {},
			lua_ls = {},
			intelephense = {},
			pyright = {},
			tailwindcss = {},
			svelte = {},
			templ = {},
			bashls = {},
			ts_ls = {},
		}

		local default_capabilities = require("cmp_nvim_lsp").default_capabilities()

		for server, config in pairs(servers) do
			config.capabilities = vim.tbl_deep_extend("force", default_capabilities, config.capabilities or {})
			vim.lsp.config(server, config)
			vim.lsp.enable(server)
		end

		vim.diagnostic.config({
			severity_sort = true,
			float = { border = "rounded", source = true },
		})

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

				local map = function(keys, func, desc)
					vim.keymap.set("n", keys, func, { buffer = args.buf, desc = "LSP: " .. desc })
				end

				map("<leader>lr", ":LspRestart<cr>", "Restart")
				map("<leader>li", ":LspInfo<cr>", "Info")
				map("<leader>ls", ":LspStop<cr>", "Stop")
				map("<leader>lS", ":LspStart<cr>", "Start")

				-- local builtin = require("telescope.builtin")

				-- map("gd", builtin.lsp_definitions, "[G]oto [D]efinition")
				-- map("gr", builtin.lsp_references, "[G]oto [R]eferences")
				-- map("gI", builtin.lsp_implementations, "[G]oto [I]mplementation")
				-- map("<leader>D", builtin.lsp_type_definitions, "Type [D]efinition")
				-- map("<leader>ds", builtin.lsp_document_symbols, "[D]ocument [S]ymbols")
				-- map("<leader>ws", builtin.lsp_dynamic_workspace_symbols, "[W]orkspace [S]ymbols")
				map("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")
				map("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction")
				map("K", vim.lsp.buf.hover, "Hover Documentation")
			end,
		})
	end,
}
