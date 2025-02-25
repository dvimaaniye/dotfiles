local opt = vim.opt
local global = vim.g
local setKey = vim.keymap.set

global.mapleader = " "
global.maplocalleader = "\\"

global.have_nerd_font = true

opt.termguicolors = true

opt.tabstop = 4
opt.shiftwidth = 4
opt.number = true
opt.relativenumber = true

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

setKey("n", "<leader><leader>x", "<cmd>source %<CR>")
setKey("n", "<leader>x", "<cmd>.lua<CR>")
setKey("v", "<leader>x", "<cmd>.lua<CR>")

setKey("n", "<leader>w", "<cmd>w<CR>")
setKey("n", "<leader>q", "<cmd>q<CR>")

setKey("n", "<leader>cn", "<cmd>cnext<CR>")
setKey("n", "<leader>cp", "<cmd>cprev<CR>")
setKey("n", "<leader>co", "<cmd>copen<CR>")
setKey("n", "<leader>cc", "<cmd>cclose<CR>")

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

vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})

require("custom.lazy")
