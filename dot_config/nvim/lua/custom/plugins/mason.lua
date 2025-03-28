return {
	{
		"williamboman/mason.nvim",
		dependencies = {
			"williamboman/mason-lspconfig.nvim",
		},
		config = function()
			require('mason').setup({})
			require('mason-lspconfig').setup {
				ensure_installed = {
					'lua_ls',
					'intelephense',
					'pyright',
					'ts_ls',
					'tailwindcss',
					'svelte',
					'templ',
					'eslint',
					'bashls',
				},
			}
		end
	}
}
