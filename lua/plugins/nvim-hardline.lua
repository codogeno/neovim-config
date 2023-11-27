--
-- A statusline / bufferline for Neovim written in Lua. 
-- It is inspired by vim-airline but aims to be as light and simple as possible.
--
return {
    'ojroques/nvim-hardline',

    config = function()
        require('hardline').setup {
            theme = 'gruvbox',   -- change theme
        }
    end,
}
