require("j.remap")
print("hello from j/init.lua")

vim.wo.relativenumber = true
vim.wo.number = true
vim.opt.scrolloff = 10

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

vim.g.maplocalleader = "\\"

require("lazy").setup({
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		init = function()
			vim.o.timeout = true
			vim.o.timeoutlen = 300
		end,
		opts = {}
	},
	{
		'nvim-telescope/telescope.nvim', tag = '0.1.6',
		-- or                              , branch = '0.1.x',
		dependencies = { 'nvim-lua/plenary.nvim' }
	},

	{ "catppuccin/nvim", name = "catppuccin", lazy=false, priority = 1000, config = function()
		print("catppuccin config()")
	end},
	{"nvim-treesitter/nvim-treesitter", build = ":TSUpdate"},
	{
		"ThePrimeagen/harpoon",
		branch = "harpoon2",
		dependencies = { "nvim-lua/plenary.nvim" }
	},
	{"ThePrimeagen/vim-be-good"},
	{
		"LazyVim/LazyVim",
		opts = {
			colorscheme = "catppuccin-mocha"
		}
	}
}
)
