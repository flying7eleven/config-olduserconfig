"
set nocompatible

"
set rtp+=~/.vim/bundle/Vundle.vim

"
filetype off
call vundle#begin()

" the list of plugins we want to install for us
"Plugin 'Valloric/YouCompleteMe'
"Plugin 'majutsushi/tagbar'
"Plugin 'ap/vim-css-color'
"Plugin 'honza/vim-snippets'
"Plugin 'terryma/vim-multiple-cursors'
"Plugin 'scrooloose/syntastic'

"
call vundle#end()
filetype plugin indent on

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
map <F7> :NERDTreeTabsToggle<CR>
map <F8> :w<CR>:!uncrustify -c ~/.uncrustify.config -f % -o %<CR>:!rm -f %.unc-backup*<CR>:e<CR>
map <F9> :TagbarToggle<CR>
map <F11> :w<CR>:!aspell -c % --mode=email --lang de_DE<CR>:e<CR>
map <F12> :w<CR>:!aspell -c % --mode=email --lang en_US<CR>:e<CR>

"
" YouCompleteMe options
"
let g:ycm_register_as_syntastic_checker = 1 "default 1
let g:Show_diagnostics_ui = 1 "default 1
let g:ycm_confirm_extra_conf = 0 "default 1
let g:ycm_enable_diagnostic_signs = 1
let g:ycm_enable_diagnostic_highlighting = 0
let g:ycm_always_populate_location_list = 1 "default 0
let g:ycm_open_loclist_on_ycm_diags = 1 "default 1
let g:ycm_complete_in_strings = 1 "default 1
let g:ycm_collect_identifiers_from_tags_files = 0 "default 0
let g:ycm_path_to_python_interpreter = '' "default ''
let g:ycm_server_use_vim_stdout = 0 "default 0 (logging to console)
let g:ycm_server_log_level = 'info' "default info
let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'  "where to search for .ycm_extra_conf.py if not found
let g:ycm_confirm_extra_conf = 1
let g:ycm_goto_buffer_command = 'same-buffer' "[ 'same-buffer', 'horizontal-split', 'vertical-split', 'new-tab' ]
let g:ycm_filetype_whitelist = { '*': 1 }
let g:ycm_key_invoke_completion = '<C-Space>'
