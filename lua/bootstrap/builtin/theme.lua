-- You can easily change to a different colorscheme.
-- Change the name of the colorscheme plugin below, and then
-- change the command in the config to whatever the name of that colorscheme is.

-- If you want to see what colorschemes are already installed, you can use `:Telescope colorscheme`.
local theme = {
	"catppuccin/nvim",
	lazy = false,
	name = "catppuccin",
	priority = 1000,

	config = function()
		require("catppuccin").setup({
			transparent_background = true,
			show_end_of_buffer = true,

			styles = {
				comments = { "italic" },
				conditionals = { "italic" },
				loops = {},
				functions = { "bold" },
			},

			integrations = {
				lsp_trouble = true,
				mason = true,
				neotree = true,
				telescope = {
					enabled = true,
					show_hidden = true,
				},
			},
		})

		vim.cmd.colorscheme("catppuccin")
	end,
}

return theme
