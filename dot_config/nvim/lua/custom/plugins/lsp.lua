return {
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			{
				"folke/lazydev.nvim",
				ft = "lua", -- only load on lua files
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
				"lua_ls",
				"intelephense",
				"pyright",
				"ts_ls",
				"tailwindcss",
				"svelte",
				"templ",
				"bashls",
				"eslint",
				"prismals",
			}

			local lsp = require("lspconfig")
			local capabilities = require("blink.cmp").get_lsp_capabilities()

			for _, server in ipairs(servers) do
				lsp[server].setup({ capabilities = capabilities })
			end

			-- lsp.lua_ls.setup({ capabilities = capabilities })
			-- lsp.intelephense.setup({ capabilities = capabilities })
			-- lsp.pyright.setup({ capabilities = capabilities })

			vim.keymap.set("n", "<leader>lr", ":LspRestart<cr>", { desc = "Lsp Restart" })

			vim.api.nvim_create_autocmd("LspAttach", {
				callback = function(args)
					local client = vim.lsp.get_client_by_id(args.data.client_id)
					if not client then
						return
					end

					-- if client.supports_method("textDocument/formatting") then
					-- 	vim.api.nvim_create_autocmd("BufWritePre", {
					-- 		buffer = args.buf,
					-- 		callback = function()
					-- 			vim.lsp.buf.format({ bufnr = args.buf, id = client.id })
					-- 		end,
					-- 	})
					-- end

					local map = function(keys, func, desc)
						vim.keymap.set("n", keys, func, { buffer = args.buf, desc = "LSP: " .. desc })
					end

					map("gd", require("telescope.builtin").lsp_definitions, "[G]oto [D]efinition")

					map("gr", require("telescope.builtin").lsp_references, "[G]oto [R]eferences")

					map("gI", require("telescope.builtin").lsp_implementations, "[G]oto [I]mplementation")

					map("<leader>D", require("telescope.builtin").lsp_type_definitions, "Type [D]efinition")

					map("<leader>ds", require("telescope.builtin").lsp_document_symbols, "[D]ocument [S]ymbols")

					map(
						"<leader>ws",
						require("telescope.builtin").lsp_dynamic_workspace_symbols,
						"[W]orkspace [S]ymbols"
					)

					map("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")

					map("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction")

					map("K", vim.lsp.buf.hover, "Hover Documentation")

					map("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")
				end,
			})
		end,
	},
}
