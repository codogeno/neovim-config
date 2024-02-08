local _ = vim.keymap.set

local function toggleCurrent()
    return
        vim.v.count == 0 and '<Plug>(comment_toggle_linewise_current)'
        or '<Plug>(comment_toggle_linewise_count)'
end

local function toggleVisual()
    return '<Plug>(comment_toggle_linewise_visual)'
end

--
-- Smart and Powerful commenting plugin for neovim
--
return {
    'numToStr/Comment.nvim',

    opts = {
        -- add any options here
    },

    lazy = false,

    config = function()
        local comment = require('Comment')
        comment.setup()

        _('n', '<C-_>', toggleCurrent, { expr = true })
        _('v', '<C-_>', toggleVisual, { expr = true })
    end,
}
