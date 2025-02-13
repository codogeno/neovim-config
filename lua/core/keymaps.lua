local _ = vim.keymap.set

-- Switch windows with Alt+Arrow
_('n', '<A-Up>',        '<C-w><Up>')
_('n', '<A-Down>',      '<C-w><Down>')
_('n', '<A-Left>',      '<C-w><Left>')
_('n', '<A-Right>',     '<C-w><Right>')

_('n', 'Y',             'yy')

_('n', '<Ins>',         '<Esc>i')   -- Turn off annoying replcace mod)

_('n', '<F2>',          ':w<CR>')
_('i', '<F2>',          '<Esc>:w<CR>')


_('n', '*',             '*N')
_('n', '<F3>',          '<leader>rw')
_('n', 'Q',             '<Nop>');   -- turn off Ex mod

-- smart Home
_('n', '<Home>',        '^')
_('n', 'H',             '^')

-- Close window
_('n', '<A-q>',         ':quit<CR>')

_('n', '<F12>',         ':NERDTreeToggle<CR>')
_('n', '<S-F11>',       ':botright copen<CR>')  -- open quickfix window always botton with full widt)
_('n', '<F23>',         ':botright copen<CR>')


_('n', '<C-F9>',        ':wa<cr>:mak<cr>')
_('n', '<F33>',         ':wa<cr>:mak<cr>')


-- Quote a word
_('n', '<leader>"',     'viw<esc>a"<esc>bi"<esc>lel')
_('n', "<leader>'",     "viw<esc>a'<esc>bi'<esc>lel")

    -- Move by indentifiers
_('n', '<C-Right>',     [[:call search('\<\k\+\>\|$')<CR>]], {silent=true})
_('n', '<C-Left>',      [[:call search('\<\k\+\>\|$', 'bW')<CR>]], {silent=true})
_('n', '<A-l>',         [[:call search('\<\k\+\>\|$')<CR>]], {silent=true})
_('n', '<A-h>',         [[:call search('\<\k\+\>\|$', 'bW')<CR>]], {silent=true})

_('n', 'Y', [[yy]])

-- Select just pasted block
_('n', 'gj',            "`[V`]")

-- Move cursor to the end after paste
_('n', 'p', "p']")

_('n', '<C-Up>',        '<C-y>')
_('n', '<C-Down>',      '<C-e>')

_('n', '<A-k>',         '<C-y>')
_('n', '<A-j>',         '<C-e>')


_('i', '<Home>',  '<Esc>^')
_('i', '<A-l>', '<Right>')
_('i', '<A-h>', '<Left>')

_('n', '<C-j>', '<PageDown>')
_('n', '<C-k>', '<PageUp>')
