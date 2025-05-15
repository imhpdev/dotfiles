return {
	"rebelot/kanagawa.nvim",
	config = function()
		require("kanagawa").setup({
			compile=true,
			transparent=false
		});
		vim.cmd("colorscheme kanagawa");
	end,
	build = function()
		vim.cmd("KaganawaCompile");
	end,
}
