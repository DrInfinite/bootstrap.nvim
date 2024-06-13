--[[ 
    Extend and create a/i textobjects

    - It enhances some builtin textobjects (like a(, a), a', and more), creates 
        new ones (like a*, a<Space>, af, a?, and more), and allows user to create 
        their own (like based on treesitter, and more).
    - Supports dot-repeat, v:count, different search methods, consecutive 
        application, and customization via Lua patterns or functions.
    - Has builtins for brackets, quotes, function call, argument, tag, 
        user prompt, and any punctuation/digit/whitespace character.
]] local mini_ai = {
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

    end
}

return mini_ai
