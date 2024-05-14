--[[
Welcome to Bootstrap.nvim, your ultimate NeoVim starting point!!
    - inspired by Kickstart.nvim (TJ DeVries)

NOTE: Kindly consider reading all the content present within the various files
present within the config. It will help guide you in your journey of configuring
your own configuration

What is Bootstrap.nvim?

    There are many ways for an individual to get started with NeoVim. The easiest
    way is to get started with a distribution. While this is amazing for someone
    who wants an experience similar to that of VSCode or any other text editor.

    The polar opposite of this is to build your own config from scratch. This
    gives you full control over what goes into NeoVim, based on your preferences,
    but is extremely difficult for a beginner to work with.

    That's where the middle ground comes in. A NeoVim stating point!

    Bootstrap.nvim is just that, a starting point for your configuration.
        The gameplan is to get you to read the entire configuration here at your
        own pace, read every line of code, understand the various APIs and their
        purposes, understand what the configuration is actually doing and then
        finally modify it in accordance with your tastes and needs!

        Once you are past that step, you are ready to truly take charge of your
        NeoVim configuration! In some cases, that might mean leaving the initial
        Bootstrap alone and not modifying it for some time. But when you are
        ready to modify it, you will note that it is broken up into smaller
        modules, helping you get started in an easy and elegant way.

        All of this requires you to possess a good understanding of the Lua, a
        multi-paradigm scripting language that is at the heart of NeoVim. If you
        aren't familiar with Lua, you can use the following resources to help get
        you started with the language, based on the amount of time at your disposal:
            - (recommended) https://learnxinyminutes.com/docs/lua/ (5-15mins, avg. 9mins)
            - (ideal) https://www.tutorialspoint.com/lua/lua_quick_guide.htm (1hr30mins - 3hrs30mins, avg. 1hr50 mins)
            - https://www.lua.org/pil/contents.html (too much free time)

        After understanding the language, your next step is to understand the "NeoVim"
        integration of the same. You must first understand how to use Lua in NeoVim,
        found here:
            - :help lua-guide
            - (NeoVim Documentation) https://neovim.io/doc/user/lua-guide.html

        Once you are done understanding the NeoVim implementation of Lua, your
        next step must be to understand the builtin script engine, the standard library
        for both the builtin engine and the editor, and all of its modules.
        These can be found here:
            - :help lua
            - (NeoVim Documentation) https://neovim.io/doc/user/lua.html

        NOTE: Some explaination will be provided throughout this guide above the
        various APIs and neovim specific implementations of various utilities
        and functions, so don't worry too much about reading everything word for word.

Getting Started:

    TODO: Getting Familiar with NeoVim is essential going forward, so starting
    with the builtin tutor is of utmost importance to those who do not know the
    basics of NeoVim.

    (If you are familiar with the basics, you can skip the next step)
        - Run the `:Tutor` command in NeoVim.
        - Walk through the whole thing before proceeding any further

    TODO: Your best friend when you are stuck is the NeoVim Documentation. The
    easiest way to access this documentation is to run the `:help` command in NeoVim.

        This opens up the home page of the NeoVim User Documentation site within
        the editor. It shows some basic information about reading, navigating
        and searching the builtin help documentation.

        This should be the first place you go to look when you're stuck or
        confused with something. It is truly the greatest tool within NeoVim.

        NOTE: A keymap "<leader>sh" is provided as part of the config. This is
        an easy way to [s]earch the [h]elp documentation when you are stuck and
        not exactly sure where to look.

    There are several `:help X` comments throughout the various directories and
    files that make up Bootstrap.nvim. These are hints about where to find more
    information about the relevant settings, plugins or Neovim features used.

    NOTE: Look for lines like this across the entire config.

    These are for you, the reader, to help you understand what is happening.
    Feel free to delete them once you know what you're doing, but they should serve as a guide
    for when you are first encountering a few different constructs in your Neovim config.

If you experience any errors while trying to install Bootstrap.nvim, run `:checkhealth` for more info.

This is all you need to get started traveller, enjoy your journey into the
beautiful world of NeoVim.
- Naparajith
]]

-- Set <space> as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are loaded (otherwise wrong leader will be used)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- [[ Install `lazy.nvim` plugin manager ]]
--    See `:help lazy.nvim.txt` or https://github.com/folke/lazy.nvim for more info

-- Set the stdpath of lazy to be the same as the stdpath of neovim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

-- Install the latest stable release of lazy and setup lazy.nvim to use it
if not vim.loop.fs_stat(lazypath) then
    local lazyrepo = "https://github.com/folke/lazy.nvim.git"
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "--branch=stable", -- latest stable release
        lazyrepo,
        lazypath,
    })
end

---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)

local imports = {
    { import = "bootstrap.builtin" },
    -- Uncomment this line while adding your custom plugins
    -- { import = "bootstrap.custom" },
}

local opts = {
    ui = {
        border = "single",
        -- If you are using a Nerd Font: set icons to an empty table which will use the
        -- default lazy.nvim defined Nerd Font icons, otherwise define a unicode icons table
        icons = vim.g.have_nerd_font and {} or {
            cmd = "⌘",
            config = "🛠",
            event = "📅",
            ft = "📂",
            init = "⚙",
            keys = "🗝",
            plugin = "🔌",
            runtime = "💻",
            require = "🌙",
            source = "📄",
            start = "🚀",
            task = "📌",
            lazy = "💤 ",
        },
    },
}

require("lazy").setup(imports, opts)
