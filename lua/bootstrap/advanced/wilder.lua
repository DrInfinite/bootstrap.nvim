local wilder = {
	"gelguy/wilder.nvim",
	version = "*",
	event = "VeryLazy",
	config = function()
		local wilder = require("wilder")
		wilder.setup({ modes = { ":", "/", "?" } })
	end,
}

return wilder
