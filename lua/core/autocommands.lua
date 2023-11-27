local cmd = vim.cmd

-- don't auto commenting new lines
cmd [[au BufEnter * set fo-=c fo-=r fo-=o]]
-- remove line lenght marker for selected filetypes
cmd [[autocmd FileType text,markdown,html,xhtml,javascript setlocal cc=0]]
-- 2 spaces for selected filetypes
cmd [[
autocmd FileType xml,html,xhtml,css,scss,javascript,json,yaml,htmljinja setlocal shiftwidth=2 tabstop=2
]]


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


--"autocmd BufRead,BufNewFile *.c,*.h,*.cpp,*.hpp,*.dba set cindent
--"autocmd FileType cpp set cindent
--autocmd Filetype javascript setlocal ts=2 sw=2 sts=0 expandtab
--autocmd FileType html setlocal ts=2 sw=2 sts=0 expandtab
--autocmd Filetype vue setlocal ts=2 sw=2 sts=0 expandtab
--autocmd FileType make setlocal noexpandtab " не заменять табы пробелами в Makefile'ах
--autocmd BufNewFile,BufRead COMMIT_EDITMSG set filetype=gitcommit " правильная подсветка при редактировании коммита после git commit
--autocmd FileType qf nnoremap <buffer> <CR> <CR>:cclose<CR>  " quickfix window after jumping

--require('plugin_settings/bar_bar')
--require('plugin_settings/NERDTree')
--require('go').setup()
