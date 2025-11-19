local keymap = vim.keymap.set
keymap("n", "j", function()
	if vim.v.count == 0 then
		return "gj"
	end
	return "j"
end, { expr = true })

keymap("n", "k", function()
	if vim.v.count == 0 then
		return "gk"
	end
	return "k"
end, { expr = true })

-- keymap("n", "<leader>w", "<cmd>w<CR>", { desc = "Write buffer" })
keymap("n", "<leader>fs", "<cmd>w<CR>", { desc = "Write buffer" })
keymap("n", "<leader>bd", "<cmd>bdelete<CR>", { desc = "Buffer delete" })

keymap("n", "<leader>qq", "<cmd>q<CR>", { desc = "Quit" })
keymap("n", "<leader>qd", "<cmd>q!<CR>", { desc = "Quit and discard" })
keymap("n", "<leader>qa", "<cmd>qall<CR>", { desc = "Quit Neovim" })

keymap("n", "[t", "<cmd>tabprevious<CR>", { desc = "Tab prev" })
keymap("n", "]t", "<cmd>tabnext<CR>", { desc = "Tab next" })

keymap("n", "[T", "<cmd>tabfirst<CR>", { desc = "Tab first" })
keymap("n", "]T", "<cmd>tablast<CR>", { desc = "Tab last" })

keymap("n", "<leader>co", "<cmd>copen<CR>", { desc = "Quickfix open" })
keymap("n", "<leader>cc", "<cmd>cclose<CR>", { desc = "Quickfix close" })

keymap({ "n", "v" }, "<leader>d", [["_d]], { desc = "Delete without yank" })
keymap("x", "<leader>p", [["_dP]], { desc = "Paste without yank" })

keymap("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })
keymap("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- center viewport after C-d and C-u
keymap("n", "<C-d>", "<C-d>zz")
keymap("n", "<C-u>", "<C-u>zz")

-- center viewport after n and N
keymap("n", "n", "nzzzv")
keymap("n", "N", "Nzzzv")

keymap("n", "<leader>\\", "<cmd>vsplit<CR>", { desc = "Split window vertically" })
keymap("n", "<leader>=", "<cmd>split<CR>", { desc = "Split window horizontally" })
keymap("n", "<C-Up>", "<cmd>resize +2<CR>", { desc = "Increase window height" })
keymap("n", "<C-Down>", "<cmd>resize -2<CR>", { desc = "Decrease window height" })
keymap("n", "<C-Left>", "<cmd>vertical resize -2<CR>", { desc = "Decrease window width" })
keymap("n", "<C-Right>", "<cmd>vertical resize +2<CR>", { desc = "Increase window width" })

-- Move lines up/down
keymap("n", "<A-J>", "<cmd>m .+1<CR>==", { desc = "Move line down" })
keymap("n", "<A-K>", "<cmd>m .-2<CR>==", { desc = "Move line up" })
keymap("v", "<A-J>", "<cmd>m '>+1<CR>gv=gv", { desc = "Move selection down" })
keymap("v", "<A-K>", "<cmd>m '<-2<CR>gv=gv", { desc = "Move selection up" })

-- Better indenting in visual mode
keymap("v", "<", "<gv", { desc = "Indent left and reselect" })
keymap("v", ">", ">gv", { desc = "Indent right and reselect" })
