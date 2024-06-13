local netrw = {
	"prichrd/netrw.nvim",
	event = "VimEnter",
	version = "*",
	config = function()
		require("netrw").setup({
			use_devicons = true,
		})
	end,
}

return netrw
