" enable syntax highlighting
syntax on

" interpret modelines and use the first two lines of a file for that
set modeline
set modelines=2

" show the line numbers
set number

"
highlight LineNr term=bold cterm=NONE ctermfg=DarkGrey ctermbg=NONE gui=NONE guifg=DarkGrey guibg=NONE

" if the gvim is running, set some specific options for it
if has( 'gui_running' )
	set guifont=Source\ Code\ Pro\ Regular\ 10
endif

" move the .viminfo file into the .vim folder
set viminfo+=n~/.vim/viminfo

" show matching brackets
set showmatch

" map some keys we need on a regular basis
map <F8> :w<CR>:!uncrustify -c ~/.uncrustify.config -f % -o %<CR>:!rm -f %.unc-backup*<CR>:e<CR>
map <F11> :w<CR>:!aspell -c % --mode=email --lang de_DE<CR>:e<CR>
map <F12> :w<CR>:!aspell -c % --mode=email --lang en_US<CR>:e<CR>
