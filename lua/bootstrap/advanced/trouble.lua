-- local trouble = {
-- 	"folke/trouble.nvim",
-- 	config = function()
-- 		require("trouble").setup({
-- 			icons = true,
-- 		})
--
-- 		vim.keymap.set("n", "<leader>tt", function()
-- 			require("trouble").toggle()
-- 		end, { desc = "[T]rouble [T]oggle" })
--
-- 		vim.keymap.set("n", "<leader>tw", function()
-- 			require("trouble").toggle("workspace_diagnostics")
-- 		end, { desc = "[T]rouble [W]orkspace Diagnostics" })
--
-- 		vim.keymap.set("n", "<leader>td", function()
-- 			require("trouble").toggle("document_diagnostics")
-- 		end, { desc = "[T]rouble [D]ocument Diagnostics" })
--
-- 		vim.keymap.set("n", "<leader>tq", function()
-- 			require("trouble").toggle("quickfix")
-- 		end, { desc = "[T]rouble [Q]uickfix List" })
--
-- 		vim.keymap.set("n", "<leader>tl", function()
-- 			require("trouble").toggle("loclist")
-- 		end, { desc = "[T]rouble [L]ocal List" })
--
-- 		vim.keymap.set("n", "[t", function()
-- 			require("trouble").next({ skip_groups = true, jump = true })
-- 		end)
--
-- 		vim.keymap.set("n", "]t", function()
-- 			require("trouble").previous({ skip_groups = true, jump = true })
-- 		end)
-- 	end,
-- }

local trouble = {
	"folke/trouble.nvim",
	opts = {}, -- for default options, refer to the configuration section for custom setup.
	cmd = "Trouble",
	keys = {
		{
			"<leader>xx",
			"<cmd>Trouble diagnostics toggle<cr>",
			desc = "Diagnostics (Trouble)",
		},
		{
			"<leader>xX",
			"<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
			desc = "Buffer Diagnostics (Trouble)",
		},
		{
			"<leader>cs",
			"<cmd>Trouble symbols toggle focus=false<cr>",
			desc = "Symbols (Trouble)",
		},
		{
			"<leader>cl",
			"<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
			desc = "LSP Definitions / references / ... (Trouble)",
		},
		{
			"<leader>xL",
			"<cmd>Trouble loclist toggle<cr>",
			desc = "Location List (Trouble)",
		},
		{
			"<leader>xQ",
			"<cmd>Trouble qflist toggle<cr>",
			desc = "Quickfix List (Trouble)",
		},
	},
}

return trouble
