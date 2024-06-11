local wilder = {
	"gelguy/wilder.nvim",
	version = "*",
	event = "VeryLazy",
	config = function()
		local wilder = require("wilder")
		wilder.setup({ modes = { ":", "/", "?" } })
		wilder.set_option(
			"renderer",
			wilder.wildmenu_renderer({
				-- highlighter applies highlighting to the candidates
				highlighter = wilder.basic_highlighter(),
			})
		)
		wilder.set_option(
			"renderer",
			wilder.popupmenu_renderer({
				-- highlighter applies highlighting to the candidates
				highlighter = wilder.basic_highlighter(),
			})
		)
	end,
}

return wilder
