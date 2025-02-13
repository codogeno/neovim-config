return {
    --
    -- The NERDTree is a file system explorer for the Vim editor
    --
    'scrooloose/nerdtree',

    config = function()
        vim.g.NERDTreeWinPos = 'right'
        vim.g.NERDChristmasTree = 1

        vim.keymap.set('n', '<F12>', ':NERDTreeToggle<CR>', {desc='Toggle NERDTree'})
        vim.keymap.set('n', '<leader>n', ':NERDTreeFind<CR>', {desc='Find the current file in filetree'})
    end,
}
