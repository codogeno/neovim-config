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

opt.timeoutlen = 400

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

opt.foldtext = 'v:lua.vim.treesitter.foldtext()'

g.go_gopls_local = 'a.yandex-team.ru'



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


-- С этой строкой отлично форматирует html файл, который содержит jinja2
--cmd[[ autocmd BufNewFile,BufRead *.html set filetype=htmldjango ]]
-----------------------------------------------------------
-- Полезные фишки
-----------------------------------------------------------

-- autocomplete
vim.o.completeopt = "menuone,noselect"

-- diagnostic
vim.diagnostic.config({
    virtual_text = true,
    virtual_lines = true,
    signs = true,
    -- float = {
    --     header = 'Diagnostics',
    --     source = true,
    --     --border = 'rounded',
    -- },
})
