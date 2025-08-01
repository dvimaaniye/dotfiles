return {
	{
		"ThePrimeagen/harpoon",
		branch = "harpoon2",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			local harpoon = require("harpoon")
			harpoon:setup()

			local conf = require("telescope.config").values
			local function toggle_telescope(harpoon_files)
				local file_paths = {}
				for _, item in ipairs(harpoon_files.items) do
					table.insert(file_paths, item.value)
				end

				require("telescope.pickers")
					.new({}, {
						prompt_title = "Harpoon",
						finder = require("telescope.finders").new_table({
							results = file_paths,
						}),
						previewer = conf.file_previewer({}),
						sorter = conf.generic_sorter({}),
					})
					:find()
			end

			vim.keymap.set("n", "<M-a>", function()
				harpoon:list():add()
			end, { desc = "Add to harpoon" })

			vim.keymap.set("n", "<M-m>", function()
				harpoon.ui:toggle_quick_menu(harpoon:list())
			end)
			-- vim.keymap.set('n', '<M-m>', function()
			-- 	toggle_telescope(harpoon:list())
			-- end, { desc = 'Open harpoon window' })

			vim.keymap.set("n", "<M-h>", function()
				harpoon:list():select(1)
			end)
			vim.keymap.set("n", "<M-j>", function()
				harpoon:list():select(2)
			end)
			vim.keymap.set("n", "<M-k>", function()
				harpoon:list():select(3)
			end)
			vim.keymap.set("n", "<M-l>", function()
				harpoon:list():select(4)
			end)
			vim.keymap.set("n", "<M-;>", function()
				harpoon:list():select(5)
			end)

			-- Toggle previous & next buffers stored within Harpoon list
			vim.keymap.set("n", "<M-p>", function()
				harpoon:list():prev()
			end)
			vim.keymap.set("n", "<M-n>", function()
				harpoon:list():next()
			end)
		end,
	},
}
