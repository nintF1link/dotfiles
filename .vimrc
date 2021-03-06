" nintF1link vimrc settings (a fork of danirod settings focussed to general purpose)
" LICENSE:
" You are free to read and study this bundle or snippets of it and to use
" it on your own vimrc settings. Feel free to tweak and adapt my vimrc to
" suit your needs and to make the changes yours. Attribution to this vimrc
" is not required although is thanked.

" vim-plug is not installed
if empty(glob("~/.vim/autoload/plug.vim"))
    silent !curl -fLso ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall
end

" Init vim-plug plugins
call plug#begin('~/.vim/plugged/')

" General purpose plugins
Plug 'gioele/vim-autoswap' " Please Vim, stop with these swap file messages. Just switch to the correct window!
Plug 'andymass/vim-matchup' " Better %
Plug 'KabbAmine/zeavim.vim' " Zeal docs support
Plug 'terryma/vim-multiple-cursors' " Multiple cursors with selection and ctrl + d
Plug 'tpope/vim-surround' " Puts ({[ etc with yss csW on normal mode, in visual mode S
Plug 'tpope/vim-fugitive' " Vim + Git = <3
Plug 'airblade/vim-gitgutter' " Git marks for add, remove, or modify a line
Plug 'ctrlpvim/ctrlp.vim' " Search with Ctrl + t
Plug 'ap/vim-buftabline' " Tabs for Vim buffers
Plug 'mattn/emmet-vim' " Emmet Ctrl + b + , in normal or insert mode
Plug 'scrooloose/nerdtree' " Display a tree view for archives with , + n + t | reload with , + n + t + t
Plug 'bling/vim-airline' " Status bar
Plug 'vim-airline/vim-airline-themes' " Themes for status bar
Plug 'ryanoasis/vim-devicons' " Display icons on multiple plugins like ctrlp, NERDtree, and airline
Plug 'raimondi/delimitmate'
Plug 'shougo/neocomplete.vim' " Autocomplete filenames and other stuff
Plug 'scrooloose/nerdcommenter' " , + c + i/s/and much other for comment a line or a block of text (,+c+i = toggle comment)
Plug 'matze/vim-move' " Move a line or selection with Shift + j/k
Plug 'Shougo/vimproc.vim', {'do' : 'make'} " TS compiler with :make

" Language support
Plug 'editorconfig/editorconfig-vim' " Vim syntax for .vimrc
Plug 'scrooloose/syntastic' " Vim syntax checker
Plug 'shawncplus/phpcomplete.vim' " PHP autocomplete
Plug 'ap/vim-css-color' " Display CSS colors
Plug 'hail2u/vim-css3-syntax' " CSS3 syntax checker
Plug 'wlangstroth/vim-racket'
Plug 'tfnico/vim-gradle'
Plug 'tpope/vim-rails' " Vim Rails productivity (I strongly recommend read the wiki)
Plug 'tpope/vim-endwise' " Autoclose ',(,{,[
Plug 'alvan/vim-closetag' " Autoclose HTML tags
Plug 'leafgarland/typescript-vim' " TypeScript
Plug 'Quramy/tsuquyomi' " TypeScript complete
Plug 'sheerun/vim-polyglot' " Better autocomplete for:
Plug 'othree/html5.vim' " HTML 5
Plug 'othree/javascript-libraries-syntax.vim' " JavaScript
Plug 'vim-ruby/vim-ruby' " Ruby
Plug 'stanangeloff/php.vim' " PHP
Plug 'cakebaker/scss-syntax.vim' " SASS
Plug 'stephpy/vim-yaml' " YAML
Plug 'keith/tmux.vim' " TMUX (only syntax highlight)
Plug 'chr4/nginx.vim' " NGINX
" Plug 'fatih/vim-go' " GO (read the wiki PLS)
" Plug 'udalov/kotlin-vim' " Kotlin

" Colorschemes
    Plug 'morhetz/gruvbox'
call plug#end()

" |~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|
" |-----------------------------------------------------------------------------------------------|
" |--------------------------------------> settings for VIM <-------------------------------------|
" |-----------------------------------------------------------------------------------------------|
" |~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|
colorscheme gruvbox

" Stop acting like classic vi
set nocompatible            " disable vi compatibility mode
set history=1000            " increase history size
set mouse=a                 " Activate the mouse

" Modify indenting settings
set autoindent              " autoindent always ON.
set expandtab               " expand tabs
set shiftwidth=4            " spaces for autoindenting
set softtabstop=4           " remove a full pseudo-TAB when i press <BS>

" Modify some other settings about files
set encoding=utf-8          " always use unicode (god damnit, windows)
set backspace=indent,eol,start " backspace always works on insert mode
set is                      " Instant search
" set hls ic                " Highlight search and ignore case
set hidden

set showmode                " always show which more are we in
set laststatus=2            " always show statusbar
set wildmenu                " enable visual wildmenu

set nowrap                  " don't wrap long lines
set number                  " show line numbers
set relativenumber          " show numbers as relative by default
set showmatch               " higlight matching parentheses and brackets

set guifont=droid           " You need complaceme.sh or manually install that font and rename the file

" |~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|
" |-----------------------------------------------------------------------------------------------|
" |----------------------------------> settings for the terminal <--------------------------------|
" |-----------------------------------------------------------------------------------------------|
" |~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|
" Are we supporting colors?
if &t_Co > 2 || has("gui_running")
   syntax on
   set colorcolumn=80
   silent! color gruvbox
   set background=dark
endif

" Extra fancyness if full pallete is supported.
if &t_Co >= 256 || has("gui_running")
    set cursorline
    set cursorcolumn
endif

" Mark trailing spaces depending on whether we have a fancy terminal or not
if &t_Co > 2 || has("gui_running")
    highlight ExtraWhitespace ctermbg=red guibg=red
    match ExtraWhitespace /\s\+$/
else
    set listchars=trail:~
    set list
endif

" |~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|
" |-----------------------------------------------------------------------------------------------|
" |----------------------------------> settings for the plugins <---------------------------------|
" |-----------------------------------------------------------------------------------------------|
" |~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|
" JavaScript libraries
let g:used_javascript_libs = 'jquery,react,vue' " that plugin have a lot of more JavaScript libraries, but I only use this

" Required for alvan/vim-closetag
let g:closetag_filenames = "*.html,*.xhtml,*.phtml,*.html.erb,*.xml.erb,*.xml"

" Correct highlight in scss files
augroup vimcss3syntax
    autocmd!

    autocmd filetype css setlocal iskeyword+=-
augroup end
au BufRead,BufNewFile *.scss set filetype=scss.css
autocmd FileType scss set iskeyword+=-

" Autoload neocomplete
let g:neocomplete#enable_at_startup = 1
inoremap <expr><tab>  pumvisible() ? "\<c-n>" : "\<tab>"
let g:neocomplete#enable_smart_case = 1
let g:neocomplete#sources#syntax#min_keyword_length = 4

" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" Ruby
let g:ruby_indent_access_modifier_style = 'indent'
let g:ruby_indent_block_style = 'do'

" Vim Surround
autocmd FileType php let b:surround_45 = "<?php \r ?>" " Key -
autocmd FileType erb let b:surround_45 = "<% \r %>"    " Key -
autocmd FileType erb let b:surround_61 = "<%= \r %>"   " Key =

" |~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|
" |-----------------------------------------------------------------------------------------------|
" |-------------------------------------> personalized keys <-------------------------------------|
" |-----------------------------------------------------------------------------------------------|
" |~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|
nnoremap <space> i<space><esc> " Insert a space in normal mode
nnoremap <CR> i<CR><esc>h      " Insert an Enter in normal mode

" Vim-move Alt dont works
let g:move_key_modifier = 'S'

" Emmet Ctrl+b+,
let mapleader=","
let g:user_emmet_leader_key='<C-b>'

" Make window navigation less painful.
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" Mapping for multiple-cursors
let g:multi_cursor_prev_key='<C-x>'
let g:multi_cursor_next_key='<C-d>'
let g:multi_cursor_skip_key='<C-l>'
let g:multi_cursor_quit_key='<Esc>'
let g:multi_cursor_start_key='<C-d>'

" Move CtrlP to CtrlT (CtrlP is for buffers)
let g:ctrlp_map = '<C-t>'

" Working with buffers is cool.
map <c-n>  :bnext<cr>
map <c-p>  :bprev<cr>
imap <c-n> <esc>:bnext<cr>a
imap <c-p> <esc>:bprev<cr>a

" Relative numbering is pretty useful for motions (3j, 5k...). however i'd
" prefer to have a way for switching relative numbers with a single map.
nmap <f5> :set invrelativenumber<cr>
imap <f5> <esc>:set invrelativenumber<cr>a

map <leader>nt :NERDTreeToggle<cr>
map <leader>ntt :NERDTree<cr>
let nerdtreequitonopen=1
let nerdtreewinsize=17
