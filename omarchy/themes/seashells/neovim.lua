return {
	{
		"odysseyalive/kitty-themes.nvim",
		priority = 1000,
		config = function()
			require("kitty-themes").setup({
				-- Configuration options
				transparent = false,
				term_colors = true,
			})
		end,
	},
	{
		"LazyVim/LazyVim",
		opts = {
			colorscheme = "SeaShells",
		},
	},
}
