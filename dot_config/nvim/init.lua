local opt = vim.opt
local global = vim.g
local setKey = vim.keymap.set

global.mapleader = " "
global.maplocalleader = ","

global.have_nerd_font = true
opt.termguicolors = true

opt.tabstop = 4
opt.shiftwidth = 4
opt.number = true
opt.relativenumber = true

opt.showmode = false

opt.clipboard = "unnamedplus"

opt.splitright = true
opt.splitbelow = true

opt.list = true
opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }

opt.cursorline = true
opt.scrolloff = 10
opt.hlsearch = true

opt.ignorecase = true
opt.smartcase = true

opt.foldenable = true
opt.foldlevel = 20
opt.foldmethod = "expr"
opt.foldexpr = "nvim_treesitter#foldexpr()"
opt.foldcolumn = "1"

opt.undofile = true
opt.undodir = vim.fn.expand("~/.local/share/nvim/undo")

opt.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"

opt.swapfile = false

-- opt.guicursor = "n-v-c:block,i-ci-ve:block,r-cr:hor20,o:hor50,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor,sm:block-blinkwait175-blinkoff150-blinkon175"

setKey("n", "j", function()
	if vim.v.count == 0 then
		return "gj"
	else
		return "j"
	end
end, { expr = true })

setKey("n", "k", function()
	if vim.v.count == 0 then
		return "gk"
	else
		return "k"
	end
end, { expr = true })

setKey("n", "<leader>bw", ":w<CR>")
setKey("n", "<leader>bd", ":bdelete<CR>")
setKey("n", "<leader>fs", ":w<CR>")

setKey("n", "<leader>qq", ":q<CR>")
setKey("n", "<leader>qd", ":q!<CR>")

setKey("n", "<leader>cn", ":cnext<CR>")
setKey("n", "<leader>cp", ":cprev<CR>")
setKey("n", "<leader>co", ":copen<CR>")
setKey("n", "<leader>cc", ":cclose<CR>")

setKey({ "n", "v" }, "<leader>d", [["_d]])
setKey("x", "<leader>p", [["_dP]])
setKey({ "n", "v" }, "<leader>y", [["+y]])
setKey("n", "<leader>Y", [["+Y]])

setKey("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })
setKey("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- center viewport after C-d and C-u
setKey("n", "<C-d>", "<C-d>zz")
setKey("n", "<C-u>", "<C-u>zz")

-- center viewport after n and N
setKey("n", "n", "nzzzv")
setKey("n", "N", "Nzzzv")

setKey("n", "<leader>sv", ":vsplit<CR>", { desc = "Split window vertically" })
setKey("n", "<leader>sh", ":split<CR>", { desc = "Split window horizontally" })
setKey("n", "<C-Up>", ":resize +2<CR>", { desc = "Increase window height" })
setKey("n", "<C-Down>", ":resize -2<CR>", { desc = "Decrease window height" })
setKey("n", "<C-Left>", ":vertical resize -2<CR>", { desc = "Decrease window width" })
setKey("n", "<C-Right>", ":vertical resize +2<CR>", { desc = "Increase window width" })

-- Move lines up/down
setKey("n", "<A-J>", ":m .+1<CR>==", { desc = "Move line down" })
setKey("n", "<A-K>", ":m .-2<CR>==", { desc = "Move line up" })
setKey("v", "<A-J>", ":m '>+1<CR>gv=gv", { desc = "Move selection down" })
setKey("v", "<A-K>", ":m '<-2<CR>gv=gv", { desc = "Move selection up" })

-- Better indenting in visual mode
setKey("v", "<", "<gv", { desc = "Indent left and reselect" })
setKey("v", ">", ">gv", { desc = "Indent right and reselect" })

vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})

require("custom.lazy")
