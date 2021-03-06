my = require('helpers')

my.map{
    ['<F5>']        = ':WinFullScreen<CR>';
    ['<F2>']        = ':w<cr>';
    -- Switch windows with Alt+Arrow
    ['<A-Up>']      = '<C-w><Up>';
    ['<A-Down>']    = '<C-w><Down>';
    ['<A-Left>']    = '<C-w><Left>';
    ['<A-Right>']   = '<C-w><Right>';
}

my.nmap{
    ['*']           = '*N';
    ['<F3>']        = '<leader>rw';
    ['Q']           = '<Nop>'; -- turn off Ex mode

     -- smart Home
    ['<Home>']      = '^';
    ['H']           = '^';

    ['<F12>']       = ':NERDTreeToggle<CR>';
    ['<S-F11>']     = ':botright copen<CR>'; -- open quickfix window always botton with full width
    ['<F23>']       = ':botright copen<CR>';


    ['<C-F9>']      = ':wa<cr>:mak<cr>';
    ['<F33>']       = ':wa<cr>:mak<cr>';

    ['gd']          = 'gdzt'; -- move found identifier on top
    ['<C-]>']       = '<C-]>zt';

    -- Quote a word
    ['<leader>"']   = 'viw<esc>a"<esc>bi"<esc>lel';
    ["<leader>'"]   = "viw<esc>a'<esc>bi'<esc>lel";

    -- Move by indentifiers
    ['<C-Right>']   = [[:call search('\<\k\+\>')<CR>]];
    ['<C-Left>']    = [[:call search('\<\k\+\>', 'bW')<CR>]];

    ['Y'] = [[yy]];

    -- ['<S-Y>'] = [[ "+y ]]

    -- Telescope bindings
    ['<leader>ff'] = [[<cmd>lua require('telescope.builtin').find_files()<CR>]];
    ['<leader>fg'] = [[<cmd>lua require('telescope.builtin').live_grep()<CR>]];

}

-- theese are not silent
my.nmap_opts({ noremap = true, silent = false },
    {
        ['<F3>']        = ':Rg <cword><CR>',
    }
)

my.imap{
    ['<F2>']    = '<Esc>:w<cr>'; --save
    ['<Ins>']   = '<Esc>i'; -- Turn off annoying replcace mode
    ['<C-F9>']  = '<Esc>:wa<cr>:mak<cr>';
    ['<F33>']  = '<Esc>:wa<cr>:mak<cr>';
    ['<Home>']  = '<Esc>^';
}
