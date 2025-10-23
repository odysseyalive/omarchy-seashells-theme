return {
	{
		"vim",
		priority = 1000,
		config = function()
			vim.cmd("source " .. vim.fn.stdpath("config") .. "/../../SeaShells.vim")
		end,
	},
	{
		"LazyVim/LazyVim",
		opts = {
			colorscheme = "SeaShells",
		},
	},
}
