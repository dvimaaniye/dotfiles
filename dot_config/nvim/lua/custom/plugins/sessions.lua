return {
	"folke/persistence.nvim",
	event = "BufReadPre",
	opts = {},
	init = function()
		vim.schedule(function()
			if vim.bo.ft == "lazy" then
				vim.cmd.quit()
			end

			if vim.fn.argc() == 0 then
				require("persistence").load()
			end
		end)
	end,
}
