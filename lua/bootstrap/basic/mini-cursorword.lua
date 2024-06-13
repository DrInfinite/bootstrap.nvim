local mini_cursorword = {
	"echasnovski/mini.cursorword",
	version = "*",
	config = function()
		require("mini.cursorword").setup({
			-- Delay (in ms) between when cursor moved and when highlighting appeared
			delay = 100,
		})
	end,
}

return mini_cursorword
