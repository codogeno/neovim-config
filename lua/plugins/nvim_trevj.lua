--
-- Nvim-plugin for doing the opposite of join-line (J) of arguments, powered by treesitter. 
--
return {
    'AckslD/nvim-trevJ.lua',

    --config = 'require("trevj").setup()',  -- optional call for configurating non-default filetypes etc
    config = function()
        local trevj = require("trevj")
        trevj.setup()  -- optional call for configurating non-default filetypes etc
        vim.api.nvim_create_user_command("SplitArgs", function() trevj.format_at_cursor() end, {})
    end,

    -- uncomment if you want to lazy load
    -- module = 'trevj',

    -- an example for configuring a keybind, can also be done by filetype
    -- setup = function()
    --   vim.keymap.set('n', '<leader>j', function()
    --     require('trevj').format_at_cursor()
    --   end)
    -- end,
}

