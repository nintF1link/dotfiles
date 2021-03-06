" nintF1link vimrc settings (a fork of danirod settings focussed to general purpose)
" LICENSE:
" You are free to read and study this bundle or snippets of it and to use
" it on your own vimrc settings. Feel free to tweak and adapt my vimrc to
" suit your needs and to make the changes yours. Attribution to this vimrc
" is not required although is thanked.

" vim-plug is not installed
if empty(glob("~/.config/nvim/autoload/plug.vim"))
    silent !npm i -g eslint babel-eslint eslint-plugin-react tern neovim typescript javascript-typescript-langserver
    silent !gem install bundler neovim ripper-tags solargraph --no-ri --no-doc
    silent !curl -fLso ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall
end

" vim-plug plugins
call plug#begin("~/.config/nvim/plugged/")

" General purpose plugins
Plug 'gioele/vim-autoswap' " Please Vim, stop with these swap file messages. Just switch to the correct window!
Plug 'rbgrouleff/bclose.vim' " close buffer without close the window <Leader>q
Plug 'andymass/vim-matchup' " Better %
Plug 'terryma/vim-multiple-cursors' " Multiple cursors with selection and ctrl + d
Plug 'tpope/vim-surround' " Puts ({[ etc with yss csW on normal mode, in visual mode S
Plug 'tpope/vim-repeat' " Repeat surround and other cmd plugins with .
Plug 'tpope/vim-eunuch' " Better cmd for Vim
Plug 'tpope/vim-dispatch' " background subprocess
Plug 'tpope/vim-fugitive' " Vim + Git = <3
Plug 'tpope/vim-abolish' " Better substitutions :%Subvert/facilit{y,ies}/building{,s}/g and toggle cases MixedCase (crm), camelCase (crc), snake_case (crs), UPPER_CASE (cru), dash-case (cr-), dot.case (cr.), space case (cr<space>), and Title Case (crt)
Plug 'tpope/vim-speeddating' " Handle dates
Plug 'ruanyl/vim-gh-line' " ,gh to open current line in GH
Plug 'sodapopcan/vim-twiggy' " Fugitive extension to work with branches :Twiggy
Plug 'junegunn/gv.vim' " Fugitive extension to work with logs :GV commit browser :GV! will only list commits that affected the current file
Plug 'rhysd/git-messenger.vim' " reveal the Git commit message under the cursor ,gm
Plug 'airblade/vim-gitgutter' " Git marks for add, remove, or modify a line
Plug 'ctrlpvim/ctrlp.vim' " Search with Ctrl + t
Plug 'mattn/emmet-vim' " Emmet Ctrl + b + , in normal or insert mode
Plug 'scrooloose/nerdtree' " Display a tree view for archives with , + n + t
Plug 'jistr/vim-nerdtree-tabs' " NERDTree on every tab
Plug 'yegappan/greplace' " Use :Gsearch and :Greplace for search and replace in files
Plug 'mileszs/ack.vim' " :Ack pattern and :Gqfopen
Plug 'bling/vim-airline' " Status bar
Plug 'vim-airline/vim-airline-themes' " Themes for status bar
Plug 'ryanoasis/vim-devicons' " Display icons on multiple plugins like ctrlp, NERDtree, and airline
Plug 'Raimondi/delimitMate' " Autoclose ',(,{,[
Plug 'roxma/nvim-yarp'
Plug 'scrooloose/nerdcommenter' " , + c + i/s/and much other for comment a line or a block of text (,+c+i = toggle comment)
Plug 'matze/vim-move' " Move a line or selection with Shift + j/k
Plug 'Shougo/vimproc.vim', {'do' : 'make'} " TS compiler with :make
Plug 'Yggdroot/indentLine'
Plug 'roxma/python-support.nvim' " auto pip install with :PythonSupportInitPython3
Plug 'jeffkreeftmeijer/vim-numbertoggle' " toggle number lines when changes window
Plug 'MattesGroeger/vim-bookmarks' " better bookmarks handle, please read the Readme.md on GitHub
Plug 'mattn/webapi-vim'
" Plug 'mattn/gist-vim' " :Gist, see the wiki please
Plug 'mbbill/undotree' " Undo tree, see the wiki please
Plug 'FooSoft/vim-argwrap' " wrap and unwrap hashes and arrays with ,a
Plug 'AndrewRadev/splitjoin.vim' " wrap code statements gS and gJ
Plug 'itchyny/vim-cursorword' " Underlines the word under the cursor
Plug 'unblevable/quick-scope' " magic with f
" Plug 'azadkuh/vim-cmus' " cmus remote control
Plug 'AndrewRadev/switch.vim' " Switch and toggle a lot of things, see the wiki
Plug 'vim-scripts/todo-vim' " TODO

" Language support
Plug 'scrooloose/syntastic' " Vim syntax checker
Plug 'ap/vim-css-color' " Display CSS colors
Plug 'tpope/vim-rails' " Vim Rails productivity (I strongly recommend read the wiki)
Plug 'tpope/vim-endwise' " Autoclose keywords on ruby with 'end'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'takkii/ruby-dictionary3'
Plug 'takkii/Bignyanco' " Ruby
Plug 'rust-lang/rust.vim' " Rust
Plug 'racer-rust/vim-racer' " Rust x2
Plug 'HerringtonDarkholme/yats.vim'
Plug 'mhartington/nvim-typescript', {'do': './install.sh'}
Plug 'Shougo/denite.nvim'
Plug 'Shougo/neoinclude.vim'
Plug 'Shougo/neco-vim'
Plug 'Shougo/context_filetype.vim'
" Plug 'carlitux/deoplete-ternjs' " js
Plug 'autozimu/LanguageClient-neovim', { 'branch': 'next', 'do': 'bash install.sh' }
Plug 'wellle/tmux-complete.vim'
Plug 'zchee/deoplete-zsh'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'Trevoke/ultisnips-rspec'
Plug 'epilande/vim-react-snippets'
Plug 'sheerun/vim-polyglot' " Better autocomplete for:
Plug 'othree/html5.vim' " HTML 5
Plug 'pangloss/vim-javascript' " JavaScript
Plug 'maxmellon/vim-jsx-pretty' " JSX
Plug 'vim-ruby/vim-ruby' " Ruby
" Plug 'stanangeloff/php.vim' " PHP
Plug 'cakebaker/scss-syntax.vim' " SASS
Plug 'stephpy/vim-yaml' " YAML
Plug 'keith/tmux.vim' " TMUX (only syntax highlight)
Plug 'chr4/nginx.vim' " NGINX
Plug 'gabrielelana/vim-markdown' " Markdown
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install' }
Plug 'wellle/targets.vim' " Better text object handling
Plug 'lifepillar/pgsql.vim' " PSQL
" Plug 'fatih/vim-go' " GO (read the wiki PLS)

" Fun
Plug 'PhilRunninger/sokoban.vim'


" Colorschemes
Plug 'morhetz/gruvbox'
call plug#end()

" |~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|
" |-----------------------------------------------------------------------------------------------|
" |--------------------------------------> settings for VIM <-------------------------------------|
" |-----------------------------------------------------------------------------------------------|
" |~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|
colorscheme gruvbox

" Ignore compiled files
set wildignore=*.pyc,*.o,*.obj,*.svn,*.swp,*.class,*.hg,*.DS_Store,*.min.*,*~

" Stop acting like classic vi
set nocompatible            " disable vi compatibility mode
set history=1000            " increase history size
set mouse=a                 " Activate the mouse
set synmaxcol=200           " Some times the line is too long, is good idea disable color syntax
set splitbelow splitright   " change split direction
let mapleader=","

" Modify indenting settings
set autoindent              " autoindent always ON.
set expandtab               " expand tabs
set shiftwidth=4            " spaces for autoindenting
set softtabstop=4           " remove a full pseudo-TAB when i press <BS>

" Some programming languages work better when only 2 spaces padding is used.
autocmd FileType html,css,sass,scss,javascript setlocal sw=2 sts=2
autocmd FileType json setlocal sw=2 sts=2
autocmd FileType ruby,eruby setlocal sw=2 sts=2
autocmd FileType yaml setlocal sw=2 sts=2
autocmd FileType markdown setlocal wrap

" Modify some other settings about files
set encoding=utf-8          " always use unicode (god damnit, windows)
set backspace=indent,eol,start " backspace always works on insert mode
set is                      " Instant search
" set hls ic                " Highlight search and ignore case
set hidden

" Turn backup off, since most stuff is in SVN, git etc. anyway...
set nobackup
set noswapfile

set noshowmode              " always show which more are we in
set laststatus=2            " always show statusbar
set wildmenu                " enable visual wildmenu

set nowrap                  " don't wrap long lines
set number                  " show line numbers
set relativenumber          " show numbers as relative by default
set showmatch               " higlight matching parentheses and brackets

set guifont=droid           " You need complaceme.sh or manually install that font and rename the file

" => Turn persistent undo on
"    means that you can undo even when you close a buffer/VIM
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
try
    set undodir=$HOME/.local/share/nvim/undo/
    set undofile
    set undolevels = 1000 "maximum number of changes that can be undone
    set undoreload = 10000 "maximum number lines to save for undo on a buffer reload
catch
endtry

" |~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|
" |-----------------------------------------------------------------------------------------------|
" |------------------------------------> settings for terminal <----------------------------------|
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
" |------------------------------------> settings for plugins <-----------------------------------|
" |-----------------------------------------------------------------------------------------------|
" |~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|
" Markdown
au FileType markdown set conceallevel=0

" CtrlP ignore files in .gitignore file
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']

" JS indenting
let g:jsx_ext_required = 1

" Disable auto pip for python 2 modules
let g:python_support_python2_require = 0

" Deoplete
let g:deoplete#enable_at_startup = 1
set runtimepath+=~/.vim-plugins/LanguageClient-neovim
call deoplete#custom#source('LanguageClient',
            \ 'min_pattern_length',
            \ 2)
let g:LanguageClient_autoStop = 0
let g:LanguageClient_serverCommands = {
            \ 'javascript': ['typescript-language-server', '--stdio'],
            \ 'javascript.jsx': ['typescript-language-server', '--stdio'],
            \ 'typescript': ['typescript-language-server', '--stdio'],
            \ 'typescript.tsx': ['typescript-language-server', '--stdio']
            \ }
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif
autocmd FileType ruby setlocal omnifunc=LanguageClient#complete

" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<S-tab>"

" Vim indent
let g:indentLine_enabled = 1
let g:indentLine_char = '▏'

" Vim airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline_powerline_fonts = 0

" Ignore some folders and files for CtrlP indexing
let g:ctrlp_custom_ignore = {
            \ 'dir':  '\.git$\|\.yardoc\|node_modules\|log\|tmp$',
            \ 'file': '\v\.(exe|so|dll|.DS_Store|.dat|.so)$'
            \ }

" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_html_checkers = []
" let where_is_ruby = systemlist('which ruby')[0]
" let where_is_rubocop = systemlist('which rubocop')[0]
" let g:syntastic_ruby_checkers = ['rubocop', 'mri']
" let g:syntastic_ruby_rubocop_exec = where_is_ruby . " " . where_is_rubocop

" Ruby
let g:ruby_indent_access_modifier_style = 'indent'
let g:ruby_indent_block_style = 'do'

" Vim Surround
autocmd FileType php let b:surround_45 = "<?php \r ?>" " Key -
autocmd FileType erb let b:surround_45 = "<% \r %>"    " Key -
autocmd FileType erb let b:surround_61 = "<%= \r %>"   " Key =
autocmd FileType rb let b:surround_61 = "#{\r}"        " Key =

" Undotree
let g:undotree_WindowLayout = 4
let g:undotree_SetFocusWhenToggle = 1
let g:undotree_DiffAutoOpen = 0

" echodoc
let g:echodoc_enable_at_startup = 1

" Bookmarks
let g:bookmark_no_default_key_mappings = 1

" NERDTree
let nerdtreequitonopen=1
let nerdtreewinsize=17

" NERDCommenter
let g:NERDSpaceDelims = 1

" Racer
let g:racer_cmd = "~/.cargo/bin/racer"
let g:racer_experimental_completer = 1

" DelimitMate
let g:delimitMate_expand_space = 1
let g:delimitMate_expand_cr = 2
let g:delimitMate_expand_inside_quotes = 1

" Quick scope only with f and t
let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']

" Flay Ruby code smell
let g:flay_on_open=1
let g:flay_on_save=1
let g:flay_piet_text=">>"

" |~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|
" |-----------------------------------------------------------------------------------------------|
" |-------------------------------------> personalized keys <-------------------------------------|
" |-----------------------------------------------------------------------------------------------|
" |~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|
" Insert a space in normal mode
nnoremap <space> i<space><esc>

" Insert an Enter in normal mode
nnoremap <CR> i<CR><esc>h
nnoremap + 0i<CR><esc>h

" Vim-move (Alt key does not work)
" let g:move_key_modifier = 'S'

" Make window navigation less painful.
nmap <BS> <C-W>h
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l
nnoremap <C-q> <C-^>

" Mapping for multiple-cursors
let g:multi_cursor_use_default_mapping=0
let g:multi_cursor_start_word_key='<C-d>'
let g:multi_cursor_start_key='<C-d>'
let g:multi_cursor_prev_key='<C-x>'
let g:multi_cursor_next_key='<C-d>'
let g:multi_cursor_skip_key='<C-l>'
let g:multi_cursor_quit_key='<Esc>'

" Move CtrlP to CtrlT (CtrlP is for buffers)
let g:ctrlp_map = '<C-t>'

" Working with buffers is cool.
nnoremap <C-n> :bnext<CR>
nnoremap <C-p> :bprev<CR>
nnoremap <C-f> :bfirst<CR>
nnoremap <C-g> :blast<CR>
nnoremap <Leader>l :tablast<CR>
nnoremap <Leader>f :tabfirst<CR>
nnoremap <Leader>n :tabNext<CR>
nnoremap <Leader>p :tabprevious<CR>

" Copy/paste from system clipboard
nnoremap  Y "+y
vnoremap  Y "+y

" better W
nnoremap W lWh
vnoremap W lWh

" Force update file
nnoremap <F5> :e!<CR>
inoremap <F5><ESC> :e!<CR>

" Map Ctrl+c to Esc
inoremap <C-c> <ESC>

" Relative numbering is pretty useful for motions (3j, 5k...). however i'd
" prefer to have a way for switching relative numbers with a single map.
nmap <F6> :set invrelativenumber<CR>
imap <F6><esc> :set invrelativenumber<CR>a

" Undo tree
nnoremap <F7> :UndotreeToggle<CR>

" See git branches
nnoremap <F8> :Twiggy<CR>

" NERDtree
map <f2> :NERDTreeTabsToggle<CR>
nmap <Leader>r :NERDTreeTabsFind<CR>

" Close the current buffer
nnoremap <Leader>q :Bclose<CR>

" Autocomplete
inoremap <expr> <C-J> pumvisible() ? "\<C-n>" : "\<C-J>"
inoremap <expr> <C-K> pumvisible() ? "\<C-p>" : "\<C-K>"

" Save and restore sessions
" Quick write session with F3
nnoremap <F3> :mksession! ~/.vim/session <cr>
" And load session with F4
nnoremap <F4> :source ~/.vim/session <cr>

" Make indent less painful.
nnoremap <Tab> >>
nnoremap <S-Tab> <<
" idk why this is not working fine
vnoremap <Tab> >gV
vnoremap <S-Tab> <gV

" Save with Ctrl + s
nnoremap <C-s> :update<CR>
inoremap <C-s> <Esc>:update<CR>a

" Wrap arrays and hashes
nnoremap <silent> <Leader>s :ArgWrap<CR>

" Bookmarks
nmap <Leader><Leader> <Plug>BookmarkToggle
nmap <Leader>i <Plug>BookmarkAnnotate
nmap <Leader>s <Plug>BookmarkShowAll
nmap <Leader>j <Plug>BookmarkNext
nmap <Leader>k <Plug>BookmarkPrev
nmap <Leader>c <Plug>BookmarkClear
nmap <Leader>x <Plug>BookmarkClearAll
nmap <Leader>kk <Plug>BookmarkMoveUp
nmap <Leader>jj <Plug>BookmarkMoveDown
nmap <Leader>g <Plug>BookmarkMoveToLine

" Racer
au FileType rust nmap gd <Plug>(rust-def)
au FileType rust nmap gs <Plug>(rust-def-split)
au FileType rust nmap gx <Plug>(rust-def-vertical)
au FileType rust nmap <Leader>gd <Plug>(rust-doc)

nnoremap <silent> <Leader>a :ArgWrap<CR>

" Switch
let g:switch_mapping = "-"

" Ack
cnoreabbrev Ack Ack!
nnoremap <Leader>t :Ack!<Space>

" TODO
nmap <F9> :TODOToggle<CR>

" Copy file path
nmap <Leader>y :let @+ = expand("%")<CR>
