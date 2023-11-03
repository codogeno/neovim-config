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

    -- Close window
    ['<A-q>']        = ':quit<CR>';

    ['<F12>']       = ':NERDTreeToggle<CR>';
    ['<S-F11>']     = ':botright copen<CR>'; -- open quickfix window always botton with full width
    ['<F23>']       = ':botright copen<CR>';


    ['<C-F9>']      = ':wa<cr>:mak<cr>';
    ['<F33>']       = ':wa<cr>:mak<cr>';

    ['<C-]>']       = '<C-]>zt';

    -- Quote a word
    ['<leader>"']   = 'viw<esc>a"<esc>bi"<esc>lel';
    ["<leader>'"]   = "viw<esc>a'<esc>bi'<esc>lel";

    -- Move by indentifiers
    ['<C-Right>']   = [[:call search('\<\k\+\>')<CR>]];
    ['<C-Left>']    = [[:call search('\<\k\+\>', 'bW')<CR>]];

    ['Y'] = [[yy]];

    -- Select just pasted block
    ['gl']          = "`[V`]";

    ['<C-Up>']      = '<C-y>';
    ['<C-Down>']      = '<C-e>';

    -- ['<S-Y>'] = [[ "+y ]]

    -- Telescope bindings
    ['<leader>ff'] = [[<cmd>lua require('telescope.builtin').find_files({sorting_strategy="ascending"})<CR>]];
    ['<leader>ffc'] = [[<cmd>lua require('telescope.builtin').find_files({search_file=vim.call('expand','<cword>'); sorting_strategy="ascending"})<CR>]];
    ['<leader>fg'] = [[<cmd>lua require('telescope.builtin').live_grep({sorting_strategy="ascending"})<CR>]];
    ['<leader>fw'] = [[<cmd>lua require('telescope.builtin').grep_string({word_match='-w';sorting_strategy="ascending"})<CR>]];
    ['<leader>fwc'] = [[<cmd>lua require('telescope.builtin').grep_string({word_match='-w';grep_open_files=true;sorting_strategy="ascending"})<CR>]];
    ['<leader>ft'] = [[<cmd>lua require('telescope.builtin').lsp_type_definitions()<CR>]];
    ['<leader>fi'] = [[<cmd>lua require('telescope.builtin').lsp_implementations({sorting_strategy="ascending"})<CR>]];
    ['<leader>fl'] = [[<cmd>lua require('telescope.builtin').resume()<CR>]];
    ['<leader>fr'] = [[<cmd>lua require('telescope.builtin').lsp_references({sorting_strategy="ascending"})<CR>]];
    ['<leader>fb'] = [[<cmd>lua require('telescope.builtin').buffers()<CR>]];
    ['<leader>fm'] = [[:Telescope harpoon marks<CR>]];

    -- Harpoon marks
    ['mm'] = '<cmd>lua require("harpoon.mark").add_file(); print("Saved!")<CR>';
    ['ml'] = '<cmd>lua require("harpoon.ui").toggle_quick_menu()<CR>';

    --['C-S-F9'] = [[:AsyncRun ya]]

    -- lsp preview 
    ['gdp'] = [[<cmd>lua require('goto-preview').goto_preview_definition()<CR>]];
    ['gtp'] = [[<cmd>lua require('goto-preview').goto_preview_type_definition()<CR>]];
    ['gip'] = [[<cmd>lua require('goto-preview').goto_preview_implementation()<CR>]];
    ['grp'] = [[<cmd>lua require('goto-preview').goto_preview_references()<CR>]];

    -- NeoWell location list
    ['<leader>ll'] = [[:NeoWellToggle<CR>]];
    ['<leader>la'] = [[:NeoWellAppend<CR>]];
    ['<leader>ld'] = [[:NeoWellOut<CR>]];
    ['<leader>le'] = [[:NeoWellEdit<CR>]];


    -- Windows
    ['<F5>']       = ':WindowsMaximize<CR>';

    --
    -- Comments
    --

    -- Toggle selection (linewise)
    ['<C-/>'] = [[<Plug>(comment_toggle_linewise)]];
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
    ['<A-l>'] = '<Right>';
    ['<A-h>'] = '<Left>';
}
