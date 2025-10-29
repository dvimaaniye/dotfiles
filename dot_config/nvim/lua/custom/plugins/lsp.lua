return {
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			{
				"folke/lazydev.nvim",
				ft = "lua",
				opts = {
					library = {
						-- See the configuration section for more details
						-- Load luvit types when the `vim.uv` word is found
						{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
					},
				},
			},
		},
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

			local blink = require("blink.cmp")

			for server, config in pairs(servers) do
				vim.lsp.enable(server)
				vim.lsp.config(server, blink.get_lsp_capabilities(config))
			end

			vim.api.nvim_create_autocmd("LspAttach", {
				callback = function(args)
					local client = vim.lsp.get_client_by_id(args.data.client_id)
					if not client then
						return
					end

					if client:supports_method("textDocument/formatting") then
						local conform = require("conform")

						vim.keymap.set("n", "<leader>mp", function()
							conform.format({ bufnr = 0 })
						end, { desc = "[M]ake [p]retty (format buffer)" })
					end

					local map = function(keys, func, desc)
						vim.keymap.set("n", keys, func, { buffer = args.buf, desc = "LSP: " .. desc })
					end

					map("<leader>lr", ":LspRestart<cr>", "Lsp Restart")
					map("<leader>li", ":LspInfo<cr>", "Lsp Info")
					map("<leader>ls", ":LspStop<cr>", "Lsp Stop")
					map("<leader>lS", ":LspStart<cr>", "Lsp Start")

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
	},
}
