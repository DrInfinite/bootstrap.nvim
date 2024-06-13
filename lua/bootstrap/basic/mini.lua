local mini = { -- Collection of various small independent plugins/modules
    "echasnovski/mini.nvim",
    config = function()
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
