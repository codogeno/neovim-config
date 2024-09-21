" cool help screens
" :he group-name
" :he highlight-groups
" :he cterm-colors

"set background=
let g:colors_name="my"

hi Normal	guifg=grey60 guibg=NvimDark
hi Whitespace guifg=#306030 guibg=NvimDark

" highlight groups
hi Cursor	guibg=khaki guifg=slategrey
"hi CursorIM
"hi Directory

hi DiffAdd	ctermbg=4
hi DiffChange	ctermbg=5
hi DiffDelete	cterm=bold ctermfg=4 ctermbg=6
hi DiffText	cterm=bold ctermbg=1

hi MatchParen	ctermbg=6 term=reverse guifg=fg guibg=None gui=bold,underline

"hi ErrorMsg
hi VertSplit	cterm=reverse guibg=#c2bfa5 guifg=grey50 gui=none
hi Folded	 ctermfg=4 guifg=grey50 guibg=grey10
hi FoldColumn	ctermfg=darkgrey ctermbg=none guibg=grey30 guifg=tan

hi IncSearch	cterm=bold ctermfg=0 ctermbg=39 guibg=SkyBlue guifg=DarkBlue gui=bold,underline
"hi IncSearch	cterm=NONE ctermfg=black ctermbg=grey
hi Search	ctermbg=39 ctermfg=0 guibg=SkyBlue guifg=DarkBlue gui=none
" hi Search	cterm=NONE ctermfg=0  ctermbg=darkgreen

hi LineNr ctermfg=238 guifg=#124830
hi ModeMsg	guifg=goldenrod
hi MoreMsg	guifg=SeaGreen
hi NonText	cterm=bold ctermfg=darkblue guifg=LightBlue guibg=none
hi Question	guifg=springgreen
hi SpecialKey	guifg=yellowgreen
hi StatusLine	guibg=#c2bfa5 guifg=black gui=none
hi StatusLineNC	guibg=#c2bfa5 guifg=grey50 gui=none
hi Title	ctermfg=5 guifg=indianred
"hi Visual	gui=none guifg=khaki guibg=olivedrab
"hi Visual	term=reverse cterm=reverse ctermbg=242 gui=none guibg=SkyBlue guifg=DarkBlue
hi Visual ctermfg=242 ctermbg=0 cterm=reverse gui=bold guifg=White guibg=#30507d
"hi Visual	cterm=reverse
hi VisualNOS	cterm=bold,underline
hi WarningMsg	ctermfg=1 guifg=salmon
hi WildMenu	ctermfg=0 ctermbg=3
"hi Menu
"hi Scrollbar
"hi Tooltip

" syntax highlighting groups
hi Comment	ctermfg=darkcyan ctermfg=6 guifg=#757575
hi Constant	ctermfg=blue ctermfg=blue guifg=SkyBlue
hi! link Identifier	Normal
hi Statement	ctermfg=3 guifg=#c4a000
hi PreProc	ctermfg=5 guifg=indianred
hi Type	ctermfg=71 guifg=#5faf5f
hi Special	ctermfg=5 guifg=navajowhite
hi Underlined	cterm=underline ctermfg=5
hi Ignore	cterm=bold ctermfg=7 guifg=grey40
hi Error	term=reverse cterm=bold ctermfg=7 ctermbg=1 guifg=White guibg=Red
hi Todo		guifg=orangered guibg=yellow2

" color terminal definitions
"hi SpecialKey	term=bold ctermfg=65 cterm=none
hi SpecialKey	ctermfg=1 cterm=none
hi Directory	ctermfg=darkcyan
hi ErrorMsg	cterm=bold ctermfg=7 ctermbg=1
hi MoreMsg	ctermfg=darkgreen
hi ModeMsg	cterm=NONE ctermfg=brown
hi Question	ctermfg=green
hi StatusLine	cterm=bold,reverse
hi StatusLineNC cterm=reverse
hi SignColumn	cterm=bold ctermfg=12 gui=bold guifg=fg guibg=none

hi default BookmarkCol ctermfg=blue ctermbg=lightblue cterm=bold guifg=DarkBlue guibg=#d0d0ff gui=bold

hi NormalFloat  guifg=grey70 guibg=grey15
hi FloatBorder  guifg=grey25 guibg=grey15
hi FloatTitle  guifg=#07ff00 guibg=#007f7f

" Colors for bar-bar plugin

hi BufferActive ctermfg=1 gui=none guibg=#202020 guifg=fg
hi BufferActiveSign gui=none guibg=#303030 guifg=fg
hi BufferActiveIndex gui=none guibg=#303030 guifg=fg
hi BufferActiveMod gui=none guibg=#303030 guifg=fg

hi BufferCurrent gui=bold guibg=none guifg=LightGreen
hi BufferCurrentSign gui=none guibg=none guifg=LightGreen
hi BufferCurrentIndex gui=none guibg=none guifg=LightGreen
hi BufferCurrentMod gui=none guibg=none guifg=LightGreen

hi BufferInactive gui=none guibg=#303030 guifg=fg
hi BufferInactiveSign gui=none guibg=#303030
hi BufferInactiveMod gui=none guibg=#303030 guifg=grey
hi BufferInactiveIndex gui=none guibg=#303030

hi BufferTabpageFill guibg=#303030

hi pmenu ctermfg=242 ctermbg=0 guibg=Grey20 guifg=Grey gui=none
hi pmenusel guibg=#51506d guifg=White gui=bold

hi ColorColumn ctermbg=1 guibg=#200000

hi htmlBoldItalic guibg=bg gui=bold guifg=DarkCyan

hi DiagnosticWarn guifg=#225315

hi LspInlayHint guifg=grey40

hi @variable guifg=grey75
hi @function guifg=#a0c0a0
"
" "vim: sw=4
