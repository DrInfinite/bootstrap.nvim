local mini = { -- Collection of various small independent plugins/modules
    "echasnovski/mini.nvim",
    config = function()
        require("lua.bootstrap.basic.mini.ai")
        require("lua.bootstrap.basic.mini.diff")
        require("lua.bootstrap.basic.mini.indentscope")
        require("lua.bootstrap.basic.mini.pairs")
        -- ... and there is more!
        --  Check out: https://github.com/echasnovski/mini.nvim
    end
}

return mini
