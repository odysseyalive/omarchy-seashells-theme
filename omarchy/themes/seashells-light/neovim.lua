return {
	{
		"vim",
		priority = 1000,
		config = function()
			vim.cmd("source " .. vim.fn.stdpath("config") .. "/../../SeaShells_Light.vim")
		end,
	},
	{
		"LazyVim/LazyVim",
		opts = {
			colorscheme = "SeaShells_Light",
		},
	},
}
