set nocompatible              " be iMproved, required
filetype off                  " required

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'chriskempson/base16-vim'
Plugin 'mileszs/ack.vim'
Plugin 'eslint/eslint'
Plugin 'gmarik/Vundle.vim'
Plugin 'kien/ctrlp.vim'
Plugin 'maksimr/vim-jsbeautify'
Plugin 'editorconfig/editorconfig-vim'
"Plugin 'Valloric/YouCompleteMe'
" Plugin 'tomtom/tcomment_vim'
Plugin 'scrooloose/syntastic'
Plugin 'scrooloose/nerdcommenter' " Quickly toggle comment blocks
Plugin 'walm/jshint.vim'
Plugin 'cakebaker/scss-syntax.vim'
Plugin 'mxw/vim-jsx'
Plugin 'vim-ruby/vim-ruby'
Bundle 'christoomey/vim-sort-motion'
Plugin 'scrooloose/nerdtree'
Plugin 'bling/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'ryanoasis/vim-devicons'
Plugin 'mustache/vim-mustache-handlebars'
Plugin 'mhinz/vim-startify'
set runtimepath^=~/.vim/bundle/ctrlp.vim
call vundle#end()            " required
set backspace=indent,eol,start
set smartindent
set cursorline " highlight current line
set nowrap
set number
set incsearch
set ignorecase
set synmaxcol=500
set mouse=r
set wildmenu
set wildignore+=*/node_modules
set termguicolors
colorscheme base16-brewer
syntax on
filetype plugin indent on
au BufRead,BufNewFile *.handlebars setfiletype html
au BufRead,BufNewFile *.es6 setfiletype javascript
au BufRead,BufNewFile *.es setfiletype javascript
if &t_Co > 2 || has("gui_running")
    set hlsearch
endif
set foldmethod=marker
nnoremap <C-W>o :call MaximizeToggle ()<CR>
nnoremap <C-W><C-O> :call MaximizeToggle ()<CR>

function! MaximizeToggle()
	if exists("s:maximize_session")
	exec "source " . s:maximize_session
	call delete(s:maximize_session)
	unlet s:maximize_session
	let &hidden=s:maximize_hidden_save
	unlet s:maximize_hidden_save
	else
	let s:maximize_hidden_save = &hidden
	let s:maximize_session = tempname()
	set hidden
	exec "mksession! " . s:maximize_session
	only
	endif
endfunction

autocmd StdinReadPre * let s:std_in=1

"map <C-j> :JSHint<CR>
map <C-j> :!eslint %<CR>
map <C-x> :set wrap nonu<CR>
map <C-f> :call JsBeautify()<cr>
map <C-o> :echo expand('%:p')<CR>
map <C-n> :NERDTree /home/bhsiung/voyager-web<CR>
map <C-s> :Startify<CR>
imap jj <Esc>

au BufNewFile,BufRead *.hbs set filetype=html
au BufNewFile,BufRead *.scss set filetype=css

set laststatus=2
let g:airline_theme='bubblegum'
let g:airline#extensions#tabline#enabled = 1


" airline config
if !exists('g:airline_symbols')
let g:airline_symbols = {}
endif

" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.crypt = '🔒'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.maxlinenr = '☰'
let g:airline_symbols.maxlinenr = ''
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.spell = 'Ꞩ'
let g:airline_symbols.notexists = '∄'
let g:airline_symbols.whitespace = 'Ξ'

" powerline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''

" old vim-powerline symbols
let g:airline_left_sep = '⮀'
let g:airline_left_alt_sep = '⮁'
let g:airline_right_sep = '⮂'
let g:airline_right_alt_sep = '⮃'
let g:airline_symbols.branch = '⭠'
let g:airline_symbols.readonly = '⭤'
let g:airline_symbols.linenr = '⭡'

"Nerd tree config
set guifont=Inconsolata\ for\ Powerline\ Nerd\ Font\ Complete\ Mono:h14
let g:airline_powerline_fonts = 1

"Syntastic 
let g:syntastic_javascript_eslint_exec = '$PWD/node_modules/.bin/eslint'

"ctrlp
let g:ctrlp_custom_ignore = '\v[\/](logs|i18n|node_modules|dist|tmp|bower_components|coverage|build|acl|screenshots|concat-stats-for)|(\.(swp|ico|git|svn))$'


:set fillchars+=vert:\ 


" scrooloose/syntastic settings
let g:syntastic_javascript_eslint_exec = '/home/bhsiung/voyager-web/node_modules/.bin/eslint'
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_loc_list_height = 5
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_error_symbol = '✕'
let g:syntastic_style_error_symbol = '✕'
let g:syntastic_warning_symbol = '⚠'
let g:syntastic_style_warning_symbol = '⚠'


" resize
nnoremap <silent> <S-left> :vertical resize -10<CR>
nnoremap <silent> <S-right> :vertical resize +10<CR>
nnoremap <silent> <S-up> :resize +10<CR>
nnoremap <silent> <S-down> :resize -10<CR>

" scrooloose/nerdcommenter
let NERDSpaceDelims=1
