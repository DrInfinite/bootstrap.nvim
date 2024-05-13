local mini = { -- Collection of various small independent plugins/modules
	"echasnovski/mini.nvim",
	config = function()
		-- Better Around/Inside textobjects
		--
		-- Examples:
		--  - va)  - [V]isually select [A]round [)]paren
		--  - yinq - [Y]ank [I]nside [N]ext [']quote
		--  - ci'  - [C]hange [I]nside [']quote
		require("mini.ai").setup( -- No need to copy this inside `setup()`. Will be used automatically.
			{
				-- Table with textobject id as fields, textobject specification as values.
				-- Also use this to disable builtin textobjects. See |MiniAi.config|.
				custom_textobjects = nil,

				-- Module mappings. Use `''` (empty string) to disable one.
				mappings = {
					-- Main textobject prefixes
					around = "a",
					inside = "i",

					-- Next/last variants
					around_next = "an",
					inside_next = "in",
					around_last = "al",
					inside_last = "il",

					-- Move cursor to corresponding edge of `a` textobject
					goto_left = "g[",
					goto_right = "g]",
				},

				-- Number of lines within which textobject is searched
				n_lines = 500,

				-- How to search for object (first inside current line, then inside
				-- neighborhood). One of 'cover', 'cover_or_next', 'cover_or_prev',
				-- 'cover_or_nearest', 'next', 'previous', 'nearest'.
				search_method = "cover_or_next",

				-- Whether to disable showing non-error feedback
				silent = false,
			}
		)
		-- Work with diff hunks
		require("mini.diff").setup({
			-- Options for how hunks are visualized
			view = {
				-- Visualization style. Possible values are 'sign' and 'number'.
				-- Default: 'number' if line numbers are enabled, 'sign' otherwise.
				style = vim.go.number and "number" or "sign",

				-- Signs used for hunks with 'sign' view
				signs = { add = "▒", change = "▒", delete = "▒" },

				-- Priority of used visualization extmarks
				priority = 199,
			},

			-- Source for how reference text is computed/updated/etc
			-- Uses content from Git index by default
			source = nil,

			-- Delays (in ms) defining asynchronous processes
			delay = {
				-- How much to wait before update following every text change
				text_change = 200,
			},

			-- Module mappings. Use `''` (empty string) to disable one.
			mappings = {
				-- Apply hunks inside a visual/operator region
				apply = "gh",

				-- Reset hunks inside a visual/operator region
				reset = "gH",

				-- Hunk range textobject to be used inside operator
				textobject = "gh",

				-- Go to hunk range in corresponding direction
				goto_first = "[H",
				goto_prev = "[h",
				goto_next = "]h",
				goto_last = "]H",
			},

			-- Various options
			options = {
				-- Diff algorithm. See `:h vim.diff()`.
				algorithm = "histogram",

				-- Whether to use "indent heuristic". See `:h vim.diff()`.
				indent_heuristic = true,

				-- The amount of second-stage diff to align lines (in Neovim>=0.9)
				linematch = 60,

				-- Whether to wrap around edges during hunk navigation
				wrap_goto = false,
			},
		})
		-- Render Indent Guides
		require("mini.indentscope").setup({
			-- Draw options
			draw = {
				-- Delay (in ms) between event and start of drawing scope indicator
				delay = 100,

				-- Animation rule for scope's first drawing. A function which, given
				-- next and total step numbers, returns wait time (in ms). See
				-- |MiniIndentscope.gen_animation| for builtin options. To disable
				-- animation, use `require('mini.indentscope').gen_animation.none()`.
				-- animation = --<function: implements constant 20ms between steps>,
				-- Symbol priority. Increase to display on top of more symbols.
				priority = 2,
			},

			-- Module mappings. Use `''` (empty string) to disable one.
			mappings = {
				-- Textobjects
				object_scope = "ii",
				object_scope_with_border = "ai",

				-- Motions (jump to respective border line; if not present - body line)
				goto_top = "[i",
				goto_bottom = "]i",
			},

			-- Options which control scope computation
			options = {
				-- Type of scope's border: which line(s) with smaller indent to
				-- categorize as border. Can be one of: 'both', 'top', 'bottom', 'none'.
				border = "both",

				-- Whether to use cursor column when computing reference indent.
				-- Useful to see incremental scopes with horizontal cursor movements.
				indent_at_cursor = true,

				-- Whether to first check input line to be a border of adjacent scope.
				-- Use it if you want to place cursor on function header to get scope of
				-- its body.
				try_as_border = false,
			},

			-- Which character to use for drawing scope indicator
			symbol = "╎",
		})
		-- Auto-complete paired characters
		require("mini.pairs").setup({
			-- In which modes mappings from this `config` should be created
			modes = { insert = true, command = false, terminal = false },

			-- Global mappings. Each right hand side should be a pair information, a
			-- table with at least these fields (see more in |MiniPairs.map|):
			-- - <action> - one of 'open', 'close', 'closeopen'.
			-- - <pair> - two character string for pair to be used.
			-- By default pair is not inserted after `\`, quotes are not recognized by
			-- `<CR>`, `'` does not insert pair after a letter.
			-- Only parts of tables can be tweaked (others will use these defaults).
			mappings = {
				["("] = { action = "open", pair = "()", neigh_pattern = "[^\\]." },
				["["] = { action = "open", pair = "[]", neigh_pattern = "[^\\]." },
				["{"] = { action = "open", pair = "{}", neigh_pattern = "[^\\]." },

				[")"] = { action = "close", pair = "()", neigh_pattern = "[^\\]." },
				["]"] = { action = "close", pair = "[]", neigh_pattern = "[^\\]." },
				["}"] = { action = "close", pair = "{}", neigh_pattern = "[^\\]." },

				['"'] = { action = "closeopen", pair = '""', neigh_pattern = "[^\\].", register = { cr = false } },
				["'"] = { action = "closeopen", pair = "''", neigh_pattern = "[^%a\\].", register = { cr = false } },
				["`"] = { action = "closeopen", pair = "``", neigh_pattern = "[^\\].", register = { cr = false } },
			},
		})
		-- Fast and flexible start screen
		require("mini.starter").setup({
			-- Whether to open starter buffer on VimEnter. Not opened if Neovim was
			-- started with intent to show something else.
			autoopen = true,

			-- Whether to evaluate action of single active item
			evaluate_single = false,

			-- Items to be displayed. Should be an array with the following elements:
			-- - Item: table with <action>, <name>, and <section> keys.
			-- - Function: should return one of these three categories.
			-- - Array: elements of these three types (i.e. item, array, function).
			-- If `nil` (default), default items will be used (see |mini.starter|).
			items = nil,

			-- Header to be displayed before items. Converted to single string via
			-- `tostring` (use `\n` to display several lines). If function, it is
			-- evaluated first. If `nil` (default), polite greeting will be used.
			header = nil,

			-- Footer to be displayed after items. Converted to single string via
			-- `tostring` (use `\n` to display several lines). If function, it is
			-- evaluated first. If `nil` (default), default usage help will be shown.
			footer = nil,

			-- Array  of functions to be applied consecutively to initial content.
			-- Each function should take and return content for 'Starter' buffer (see
			-- |mini.starter| and |MiniStarter.content| for more details).
			content_hooks = nil,

			-- Characters to update query. Each character will have special buffer
			-- mapping overriding your global ones. Be careful to not add `:` as it
			-- allows you to go into command mode.
			query_updaters = "abcdefghijklmnopqrstuvwxyz0123456789_-.",

			-- Whether to disable showing non-error feedback
			silent = false,
		})
		-- Minimal and fast statusline module with opinionated default look
		require("mini.statusline").setup({
			-- Content of statusline as functions which return statusline string. See
			-- `:h statusline` and code of default contents (used instead of `nil`).
			content = {
				-- Content for active window
				active = nil,
				-- Content for inactive window(s)
				inactive = nil,
			},

			-- Whether to use icons by default
			use_icons = vim.g.have_nerd_font,

			-- Whether to set Vim's settings for statusline (make it always shown with
			-- 'laststatus' set to 2). To use global statusline in Neovim>=0.7.0, set
			-- this to `false` and 'laststatus' to 3.
			set_vim_settings = true,
			section_location = function()
				return "%2l:%-2v"
			end,
		})

		-- Fast and feature-rich surround actions
		require("mini.surround").setup({
			-- Add custom surroundings to be used on top of builtin ones. For more
			-- information with examples, see `:h MiniSurround.config`.
			custom_surroundings = nil,

			-- Duration (in ms) of highlight when calling `MiniSurround.highlight()`
			highlight_duration = 500,

			-- Module mappings. Use `''` (empty string) to disable one.
			mappings = {
				add = "sa", -- Add surrounding in Normal and Visual modes
				delete = "sd", -- Delete surrounding
				find = "sf", -- Find surrounding (to the right)
				find_left = "sF", -- Find surrounding (to the left)
				highlight = "sh", -- Highlight surrounding
				replace = "sr", -- Replace surrounding
				update_n_lines = "sn", -- Update `n_lines`

				suffix_last = "l", -- Suffix to search with "prev" method
				suffix_next = "n", -- Suffix to search with "next" method
			},

			-- Number of lines within which surrounding is searched
			n_lines = 100,

			-- Whether to respect selection type:
			-- - Place surroundings on separate lines in linewise mode.
			-- - Place surroundings on each line in blockwise mode.
			respect_selection_type = false,

			-- How to search for surrounding (first inside current line, then inside
			-- neighborhood). One of 'cover', 'cover_or_next', 'cover_or_prev',
			-- 'cover_or_nearest', 'next', 'prev', 'nearest'. For more details,
			-- see `:h MiniSurround.config`.
			search_method = "cover",

			-- Whether to disable showing non-error feedback
			silent = false,
		})

		-- ... and there is more!
		--  Check out: https://github.com/echasnovski/mini.nvim
	end,
}

return mini
