syntax on
set modeline
set modelines=2
set number
highlight LineNr term=bold cterm=NONE ctermfg=DarkGrey ctermbg=NONE gui=NONE guifg=DarkGrey guibg=NONE
if has( 'gui_running' )
	set guifont=Source\ Code\ Pro\ Regular\ 10
endif
map <F8> :w<CR>:!uncrustify -c ~/.uncrustify.config -f % --no-backup<CR>:e<CR>
map <F11> :w<CR>:!aspell -c % -l de_DE<CR>:e<CR>
map <F12> :w<CR>:!aspell -c % -l en_US<CR>:e<CR>
