local cmd = vim.cmd             -- execute Vim commands
local exec = vim.api.nvim_exec  -- execute Vimscript
local g = vim.g                 -- global variables
local opt = vim.opt             -- global/buffer/windows-scoped options

opt.syntax = 'true'
opt.colorcolumn = '130'              -- Разделитель на 130 символов
-- opt.cursorline = true               -- Подсветка строки с курсором
opt.number = true                   -- Включаем нумерацию строк
opt.relativenumber = true           -- Вкл. относительную нумерацию строк
--opt.so=999                          -- Курсор всегда в центре экрана
opt.scrolloff=3
opt.sidescrolloff = 3
opt.undofile = true                 -- Возможность отката назад
opt.splitright = true               -- vertical split вправо
opt.splitbelow = true               -- horizontal split вниз

opt.mouse = 'a'
opt.autowrite = true
opt.autoindent = true
opt.smartcase = true
opt.ignorecase = true
opt.incsearch = true
opt.hlsearch = true
opt.lazyredraw = true
opt.foldmethod = 'indent'
opt.listchars = 'tab:→ ,trail:·'
opt.list = true
opt.tagstack = true
opt.foldenable = false
opt.signcolumn = 'yes:1'
opt.wildmode = 'longest:full,full'
opt.joinspaces = false
opt.indentexpr = ''
--opt.belloff='backspace,cursor,copy,ctrlg,esc,insertmode,register,spell,wildmode'
opt.belloff='backspace,cursor,esc,error'

g.loaded_matchparen = 1 -- diable standart match paren plugin as of alternative plugin



-----------------------------------------------------------
-- Color scheme
-----------------------------------------------------------
opt.termguicolors = true      --  24-bit RGB colors
cmd 'colorscheme my'
-----------------------------------------------------------
-- Tabs and indents
-----------------------------------------------------------
cmd([[
filetype indent plugin on
syntax enable
]])
opt.expandtab = true      -- use spaces instead of tabs
opt.shiftwidth = 4        -- shift 4 spaces when tab
opt.tabstop = 4           -- 1 tab == 4 spaces
opt.smartindent = true    -- autoindent new lines
-- don't auto commenting new lines
cmd [[au BufEnter * set fo-=c fo-=r fo-=o]]
-- remove line lenght marker for selected filetypes
cmd [[autocmd FileType text,markdown,html,xhtml,javascript setlocal cc=0]]
-- 2 spaces for selected filetypes
cmd [[
autocmd FileType xml,html,xhtml,css,scss,javascript,json,yaml,htmljinja setlocal shiftwidth=2 tabstop=2
]]
-- С этой строкой отлично форматирует html файл, который содержит jinja2
--cmd[[ autocmd BufNewFile,BufRead *.html set filetype=htmldjango ]]
-----------------------------------------------------------
-- Полезные фишки
-----------------------------------------------------------
-- Запоминает где nvim последний раз редактировал файл
cmd [[
autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
]]
-- Подсвечивает на доли секунды скопированную часть текста
--exec([[
--augroup YankHighlight
--autocmd!
--autocmd TextYankPost * silent! lua vim.highlight.on_yank{higroup="IncSearch", timeout=700}
--augroup end
--]], false)

-- quickfix window will fill fulll width
cmd [[
    autocmd FileType qf wincmd J
]]

-- close quickfix window after jumping
cmd [[
    autocmd FileType qf nnoremap <buffer> '<C-CR>' <CR>:cclose<CR>
]]

cmd [[
    autocmd FileType python set indentexpr=
]]

cmd [[
    autocmd BufRead,BufNewFile ya.make   setfiletype bash
]]

-- autocomplete
vim.o.completeopt = "menuone,noselect"
vim.lsp.set_log_level("OFF")


--"autocmd BufRead,BufNewFile *.c,*.h,*.cpp,*.hpp,*.dba set cindent
--"autocmd FileType cpp set cindent
--autocmd Filetype javascript setlocal ts=2 sw=2 sts=0 expandtab
--autocmd FileType html setlocal ts=2 sw=2 sts=0 expandtab
--autocmd Filetype vue setlocal ts=2 sw=2 sts=0 expandtab
--autocmd FileType make setlocal noexpandtab " не заменять табы пробелами в Makefile'ах
--autocmd BufNewFile,BufRead COMMIT_EDITMSG set filetype=gitcommit " правильная подсветка при редактировании коммита после git commit
--autocmd FileType qf nnoremap <buffer> <CR> <CR>:cclose<CR>  " quickfix window after jumping

require('plugin_settings/bar_bar')
require('plugin_settings/NERDTree')
