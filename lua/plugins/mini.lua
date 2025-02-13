--
-- Split and join arguments
--
return {
    'echasnovski/mini.nvim';

    config = function()
        require('mini.splitjoin').setup()
        -- require('mini.indentscope').setup()
    end;
}
