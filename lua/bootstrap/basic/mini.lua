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
                goto_right = "g]"
            },

            -- Number of lines within which textobject is searched
            n_lines = 500,

            -- How to search for object (first inside current line, then inside
            -- neighborhood). One of 'cover', 'cover_or_next', 'cover_or_prev',
            -- 'cover_or_nearest', 'next', 'previous', 'nearest'.
            search_method = "cover_or_next",

            -- Whether to disable showing non-error feedback
            silent = false
        })
        -- Work with diff hunks
        require("mini.diff").setup({
            -- Options for how hunks are visualized
            view = {
                -- Visualization style. Possible values are 'sign' and 'number'.
                -- Default: 'number' if line numbers are enabled, 'sign' otherwise.
                style = vim.go.number and "number" or "sign",

                -- Signs used for hunks with 'sign' view
                signs = {
                    add = "▒",
                    change = "▒",
                    delete = "▒"
                },

                -- Priority of used visualization extmarks
                priority = 199
            },

            -- Source for how reference text is computed/updated/etc
            -- Uses content from Git index by default
            source = nil,

            -- Delays (in ms) defining asynchronous processes
            delay = {
                -- How much to wait before update following every text change
                text_change = 200
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
                goto_last = "]H"
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
                wrap_goto = false
            }
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
                priority = 2
            },

            -- Module mappings. Use `''` (empty string) to disable one.
            mappings = {
                -- Textobjects
                object_scope = "ii",
                object_scope_with_border = "ai",

                -- Motions (jump to respective border line; if not present - body line)
                goto_top = "[i",
                goto_bottom = "]i"
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
                try_as_border = false
            },

            -- Which character to use for drawing scope indicator
            symbol = "╎"
        })
        -- Auto-complete paired characters
        require("mini.pairs").setup({
            -- In which modes mappings from this `config` should be created
            modes = {
                insert = true,
                command = false,
                terminal = false
            },

            -- Global mappings. Each right hand side should be a pair information, a
            -- table with at least these fields (see more in |MiniPairs.map|):
            -- - <action> - one of 'open', 'close', 'closeopen'.
            -- - <pair> - two character string for pair to be used.
            -- By default pair is not inserted after `\`, quotes are not recognized by
            -- `<CR>`, `'` does not insert pair after a letter.
            -- Only parts of tables can be tweaked (others will use these defaults).
            mappings = {
                ["("] = {
                    action = "open",
                    pair = "()",
                    neigh_pattern = "[^\\]."
                },
                ["["] = {
                    action = "open",
                    pair = "[]",
                    neigh_pattern = "[^\\]."
                },
                ["{"] = {
                    action = "open",
                    pair = "{}",
                    neigh_pattern = "[^\\]."
                },

                [")"] = {
                    action = "close",
                    pair = "()",
                    neigh_pattern = "[^\\]."
                },
                ["]"] = {
                    action = "close",
                    pair = "[]",
                    neigh_pattern = "[^\\]."
                },
                ["}"] = {
                    action = "close",
                    pair = "{}",
                    neigh_pattern = "[^\\]."
                },

                ['"'] = {
                    action = "closeopen",
                    pair = '""',
                    neigh_pattern = "[^\\].",
                    register = {
                        cr = false
                    }
                },
                ["'"] = {
                    action = "closeopen",
                    pair = "''",
                    neigh_pattern = "[^%a\\].",
                    register = {
                        cr = false
                    }
                },
                ["`"] = {
                    action = "closeopen",
                    pair = "``",
                    neigh_pattern = "[^\\].",
                    register = {
                        cr = false
                    }
                }
            }
        })

        -- ... and there is more!
        --  Check out: https://github.com/echasnovski/mini.nvim
    end
}

return mini
