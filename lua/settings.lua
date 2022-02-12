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

g.loaded_matchparen = 1 -- diable standart match paren plugin as of alternative plugin

-----------------------------------------------------------
-- Цветовая схема
-----------------------------------------------------------
opt.termguicolors = true      --  24-bit RGB colors
cmd 'colorscheme my'
-----------------------------------------------------------
-- Табы и отступы
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


-- close quickfix window after jumping
cmd [[
    autocmd FileType qf nnoremap <buffer> <CR> <CR>:cclose<CR>
]]

cmd [[
    autocmd FileType python set indentexpr=
]]

-- autocomplete
vim.o.completeopt = "menuone,noselect"

--opt.termguicolors = true


---- setup Vim itself
----
----set noerrorbells
----set novisualbell

---- opt.noeb vb t_vb=

--lang messages en_US.UTF-8
--set nocompatible  " Чтоб работали стрелки на FreeBSD
--set sessionoptions-=options
--set autowrite
--set nowrap

--set fileformats=unix,dos

--set bs=2

--set autoindent

--set expandtab
--set softtabstop=4
--set smarttab
--set shiftwidth=4
--set scrolloff=3

--set ignorecase smartcase "Игнорировать регистр букв при поиске
--set incsearch

--set hidden " allow open new buf without saving changed buffer

--set mouse=a
--set laststatus=2
--set showcmd

--set statusline=%<%f%h%m%r%=%l,%v\ \ %b/0x%B\ \ %V\ %P
--set hlsearch

--set lazyredraw  " Не перерисовывать экран посреди макроса
--" set foldcolumn=2  " Боковая колонка со свёрнутыми блоками


--nnoremap * *N


--let g:vim_syntax_folding = 1
--let g:xml_syntax_folding = 1
--au FileType xml setlocal foldmethod=syntax

--let docbk_type="xml"

--set fileencodings=utf-8,cp1251,koi8-r,cp866 " список кодировок файлов для автоопределения

--if has("win32")
--    set guifont=ter-c16n
--else
--    set guifont=Terminus\ (TTF)\ Medium\ 15
--    "set guifont=Fira\ Code\ Line
--endif

--set foldmethod=indent
--set nofoldenable

--exec "colorscheme" "my_desert"

--set listchars=tab:→\ ,trail:·    " подсветка табов и пробелов в конце строки
--set list                        " включена по дефолту

--set indentexpr=

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
