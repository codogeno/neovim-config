--
-- This plugin provides a start screen for Vim and Neovim.
--
-- It provides dynamically created headers or footers and uses configurable lists to show recently used or bookmarked files
-- and persistent sessions.
-- All of this can be accessed in a simple to use menu that even allows to open multiple entries at once.
--
-- Startify doesn't get in your way and works out-of-the-box, but provides many options for fine-grained customization.
--
return {
    'mhinz/vim-startify',

    config = function()
        local g = vim.g

        g.startify_change_to_dir = 0
        g.startify_list_order = {
            'dir',
            'bookmarks',
            'sessions',
        }
        g.startify_custom_header= ''
    end
}
