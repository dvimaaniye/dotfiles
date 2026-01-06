local M = {}

M.setup = function()
	local dap = require("dap")
	local ui = require("dap-view")
	require("nvim-dap-virtual-text").setup({})

	for _, adapterType in ipairs({ "node", "chrome", "msedge" }) do
		local pwaType = "pwa-" .. adapterType
		if not dap.adapters[pwaType] then
			dap.adapters[pwaType] = {
				type = "server",
				host = "localhost",
				port = "${port}",
				executable = {
					command = "node",
					args = {
						vim.fn.stdpath("data") .. "/mason/packages/js-debug-adapter/js-debug/src/dapDebugServer.js",
						"${port}",
					},
				},
			}
		end
		-- Fallback adapter for "node" -> "pwa-node"
		if adapterType == "node" and not dap.adapters["node"] then
			dap.adapters["node"] = function(cb, config)
				config.type = "pwa-node"
				local nativeAdapter = dap.adapters["pwa-node"]
				if type(nativeAdapter) == "function" then
					nativeAdapter(cb, config)
				else
					cb(nativeAdapter)
				end
			end
		end
	end

	local js_filetypes = { "javascript", "typescript", "typescriptreact", "javascriptreact" }

	for _, lang in ipairs(js_filetypes) do
		if not dap.configurations[lang] then
			local runtimeExecutable = nil
			if lang:find("typescript") then
				runtimeExecutable = vim.fn.executable("tsx") == 1 and "tsx" or "ts-node"
			end

			dap.configurations[lang] = {
				{
					type = "pwa-node",
					request = "launch",
					name = "Launch file",
					program = "${file}",
					cwd = "${workspaceFolder}",
					runtimeExecutable = runtimeExecutable,
					sourceMaps = true,
					skipFiles = { "<node_internals>/**", "**/node_modules/**" },
				},
				{
					type = "pwa-node",
					request = "attach",
					name = "Attach to process",
					processId = require("dap.utils").pick_process,
					cwd = "${workspaceFolder}",
				},
				{
					type = "pwa-chrome",
					request = "launch",
					name = "Chrome: http://localhost:3000",
					url = "http://localhost:3000",
					webRoot = "${workspaceFolder}",
					sourceMaps = true,
				},
			}
		end
	end

	vim.keymap.set("n", "<leader>Bt", dap.toggle_breakpoint, { desc = "DAP: Toggle breakpoint" })
	vim.keymap.set("n", "<leader>Bc", dap.run_to_cursor, { desc = "DAP: Run to cursor" })

	vim.keymap.set("n", "<F1>", dap.continue, { desc = "DAP: Continue" })
	vim.keymap.set("n", "<F2>", dap.pause, { desc = "DAP: Pause" })
	vim.keymap.set("n", "<F3>", dap.step_into, { desc = "DAP: Step into" })
	vim.keymap.set("n", "<F4>", dap.step_over, { desc = "DAP: Step over" })
	vim.keymap.set("n", "<F5>", dap.step_out, { desc = "DAP: Step out" })
	vim.keymap.set("n", "<F6>", dap.step_back, { desc = "DAP: Step back" })
	vim.keymap.set("n", "<F11>", dap.restart, { desc = "DAP: Restart" })
	vim.keymap.set("n", "<F12>", dap.close, { desc = "DAP: Stop" })

	-- Watch expression keymap
	vim.keymap.set("n", "<leader>Bw", function()
		require("dap.ui.widgets").centered_float(require("dap.ui.widgets").expression)
	end, { desc = "DAP: Watch expression" })

	-- Watch variable under cursor
	vim.keymap.set("n", "<leader>Bv", function()
		require("dap.ui.widgets").hover()
	end, { desc = "DAP: Evaluate variable" })

	-- Scopes/locals sidebar
	vim.keymap.set("n", "<leader>Bs", function()
		require("dap.ui.widgets").centered_float(require("dap.ui.widgets").scopes)
	end, { desc = "DAP: Show scopes" })

	vim.keymap.set("n", "<leader>BU", ui.toggle, { desc = "DAP: Toggle UI" })

	dap.listeners.before.attach.dapui_config = function()
		ui.open()
	end
	dap.listeners.before.launch.dapui_config = function()
		ui.open()
	end
	dap.listeners.before.event_terminated.dapui_config = function()
		ui.close()
	end
	dap.listeners.before.event_exited.dapui_config = function()
		ui.close()
	end
end

return M
