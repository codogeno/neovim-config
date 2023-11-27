return {
    --
    -- The NERDTree is a file system explorer for the Vim editor
    --
    'scrooloose/nerdtree',

    config = function()
        vim.g.NERDTreeWinPos = 'right'
        vim.g.NERDChristmasTree = 1

        vim.keymap.set('n', '<F12>', ':NERDTreeToggle<CR>', {desc='Toggle NERDTree'})
    end,
}
