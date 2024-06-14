local lualine = {
	"nvim-lualine/lualine.nvim",
	event = "VeryLazy",
	init = function()
		vim.g.lualine_laststatus = vim.o.laststatus
		if vim.fn.argc(-1) > 0 then
			vim.o.statusline = " "
		else
			vim.o.laststatus = 0
		end
	end,
	config = function()
		require("lualine").setup({
			options = {
				component_separators = "|",
				disabled_filetypes = {
					statusline = { "alpha" },
				},
				globalstatus = true,
				section_separators = "",
				theme = "auto",
			},
			sections = {
				lualine_a = { "mode" },
				lualine_b = { "branch", "diff", "diagnostics" },
				lualine_c = { "filename", "filesize" },
				lualine_x = {
					{
						"filetype",
						icon = {
							align = "left",
						},
					},
				},
				lualine_y = {
					{
						"progress",
						separator = " ",
						padding = {
							left = 1,
							right = 0,
						},
					},
					{
						"location",
						padding = {
							left = 0,
							right = 1,
						},
					},
				},
				lualine_z = { "codeium#GetStatusString", "encoding" },
			},
			extensions = { "neo-tree", "mason", "lazy", "trouble" },
		})
	end,
}

return lualine
