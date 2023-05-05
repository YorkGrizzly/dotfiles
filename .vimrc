"""""""""""""""""""""""""""""""""""""  Indentation Options  """""""""""""""""""""""""""""""""""""
set autoindent "New lines inherit the indentation of previous lines
set expandtab "Convert tabs to spaces
filetype plugin indent on "Enable indentation rules, syntax highlighting that are file-type specific
set shiftwidth=4 "When shifting, indent using 4 spaces
set smarttab "Insert "tabstop" number of spaces when the "tab" key is pressed
set softtabstop=4 "Indent using 4 spaces
set tabstop=4 "Tab size is equal to 4 spaces


"""""""""""""""""""""""""""""""""""""  Editing Options  """""""""""""""""""""""""""""""""""""
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o  "Disable autocommenting on newline
  "creates line when in insert mode
au InsertEnter * set cul
au InsertLeave * set nocul


"""""""""""""""""""""""""""""""""""""  Search Options  """""""""""""""""""""""""""""""""""""
set hlsearch "Enable search highlighting
set ignorecase "Ignore case when searching
set incsearch "Incremental search that shows partial matches
set smartcase "Automatically switch search to case-sensitive when search query contains an uppercase letter
set shortmess-=S "show search match counts


"""""""""""""""""""""""""""""""""""""  Performance Options  """""""""""""""""""""""""""""""""""""
set complete-=i "Limit the files searched for auto-completes
set ssop-=options "Do not store global and local values in a session
set ssop-=folds "Do not store folds


"""""""""""""""""""""""""""""""""""""  Text Rendering Options  """""""""""""""""""""""""""""""""""""
set foldmethod=indent "Fold based on indentation levels
"set foldmethod=syntax "set folds by syntax (this might cause lags)
set foldlevelstart=99 "open file with all folds open
set display+=lastline "Always try to show a paragraph's last line
set encoding=utf-8 "Use an encoding that supports unicode
set linebreak "Avoid wrapping a line in the middle of a word
set scrolloff=1 "The number of screen lines to keep above and below the cursor (a large value causes the cursor to stay in the middle line when possible
syntax enable "Enable syntax highlighting
set wrap "Enable line wrapping (display on newline when line is full to prevent horizontal scrolling


"""""""""""""""""""""""""""""""""""""  User Interface Options  """""""""""""""""""""""""""""""""""""
set laststatus=2 "Always display the status bar
set ruler "Always show cursor position in status bar
set wildmenu "Display command line's tab complete options as a menu
set number "Show line numbers on the sidebar
set relativenumber "Show relative numbers to current line
set mouse=a "Enable mouse for scrolling and resizing
set title "set the window's title, reflecting the file currently being edited
"set updatetime=500 "time in milliseconds to hold cursor for popup
set completeopt=popup "override completion so it shows in popup rather than pane (YCM doesn't create new window)
set redrawtime=10000 "Give more time to redraw.


"""""""""""""""""""""""""""""""""""""  Miscellaneous Options  """""""""""""""""""""""""""""""""""""
set backspace=indent,eol,start "Allow backspacing over indentation, line breaks and insertion start
"set confirm "Display a confirmation dialog when closing an unsaved file
set history=1000 "Increase the undo limit
"set noswapfile  "Disable swap files

set nocompatible "Enable enhancements and improvements of Vi


"""""""""""""""""""""""""""""""""""""""""""""""  KEY MAPPINGS  """""""""""""""""""""""""""""""""""""""""""""""
"remap esc, enter normal mode by typing two j (remember to remove trailing whitespace for following, else jumps)
imap jj <Esc>
"press 'J'/'K' in visual mode to move selected text down/up with autoformatting
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv
"write file
nnoremap <leader>w :w<CR>
"quit file
nnoremap <leader>q :q<CR>
nnoremap <leader>qa :qa<CR>

"search pattern
nnoremap <leader>f <ESC>/
" search for visually hightlighted text
vnoremap <leader>sv y<ESC>/<c-r>"<CR>  "

"quickly disable line numbers and signcolumn, useful for copy paste
nnoremap <leader>nn :set nonumber norelativenumber<CR>:set signcolumn=no<CR>
nnoremap <leader>sn :set number relativenumber<CR>: set signcolumn=yes<CR>
"set syntax on
nnoremap <leader>ss :set syntax=on<CR>: syntax on<CR>:RainbowLoad <CR>

"map quitall, useful for git difftool
nnoremap ZQA :qa<CR>

"load ~/.vimrc quickly
nnoremap <leader>lv :source ~/.vimrc<CR>


""""""""""""""""""""" set cursor to straight line in insert mode """""""""""""""""""""""
" good for MobaXterm, but has to change cursor to straight line by default in settings
" to make cursor block by default:
" add: ' echo -en "\e[=2c" ' into .bashrc and .bash_profile

if exists('$TMUX')
    let &t_SI .= "\ePtmux;\e\e[=1c\e\\"
    let &t_EI .= "\ePtmux;\e\e[=2c\e\\"
else
    let &t_SI .= "\e[=1c"
    let &t_EI .= "\e[=2c"
endif


"if has("autocmd")  "Windows, MAC Terminal
"  au VimEnter,InsertLeave * silent execute '!echo -ne "\e[2 q"' | redraw!
"  au InsertEnter,InsertChange *
"    \ if v:insertmode == 'i' | 
"    \   silent execute '!echo -ne "\e[6 q"' | redraw! |
"    \ elseif v:insertmode == 'r' |
"    \   silent execute '!echo -ne "\e[4 q"' | redraw! |
"    \ endif
"  au VimLeave * silent execute '!echo -ne "\e[ q"' | redraw!
"endif

"GNOME Terminal (version 2.26):
"if has("autocmd")
"  au InsertEnter * silent execute "!gconftool-2 --type string --set /apps/gnome-terminal/profiles/Default/cursor_shape ibeam"
"  au VimEnter,InsertLeave * silent execute "!gconftool-2 --type string --set /apps/gnome-terminal/profiles/Default/cursor_shape block"
"  au VimLeave * silent execute "!gconftool-2 --type string --set /apps/gnome-terminal/profiles/Default/cursor_shape ibeam"
"endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""



""""""""""""""""""""""""""""""""""""" PLUGINS """""""""""""""""""""""""""""""""""""""""""
" TO INSTALL VIM-PLUG:
"curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
"   https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

" Vim-Plug settings (':PlugInstall' to install)
call plug#begin('~/.vim/plugged')

"display
Plug 'tpope/vim-fugitive' "git
Plug 'rhysd/git-messenger.vim' "reveal message from git under cursor
Plug 'preservim/nerdtree'
Plug 'preservim/tagbar' "taglist

""" FZF (filefinder) """
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
nnoremap <C-a> :FZF<CR>


Plug 'google/vim-searchindex' "show search counts greater than 99
Plug 'jlanzarotta/bufexplorer' "buffer explorer
Plug 'itchyny/lightline.vim' "lightline (status bar)
Plug 'Plug 'edkolev/tmuxline.vim'  "Style tmux bar with vim line.

"editing
"Plug 'ycm-core/YouCompleteMe' "just run `python3 install.py --clangd-completer` to build with only C-family support avoiding errors for other languages.
Plug 'vim-syntastic/syntastic'  "syntax checker
"Syntastic, error highlighting plugin
"https://github.com/vim-syntastic/syntastic#installation
Plug 'ervandew/supertab' "use Tab for all insert completion
Plug 'frazrepo/vim-rainbow' "color paired brackets
Plug 'preservim/nerdcommenter' "quick commenter ('\cc' to comment out,'\cu' to uncomment,'\cA' to add appending comment)
Plug 'jiangmiao/auto-pairs' "auto add, delete bracket pairs
Plug 'tpope/vim-surround' "vim surround
Plug 'neoclide/jsonc.vim' "add JSON comment filetype
Plug 'rhysd/vim-clang-format' "clang format for Vim
Plug 'rickhowe/spotdiff.vim' "diff parts of files
Plug 'whiteinge/diffconflicts' "two-way diff for conflict-marked files

"colorschemes
Plug 'flazz/vim-colorschemes'  "All colorschemes
Plug 'dracula/vim',{'as':'dracula'}
Plug 'morhetz/gruvbox'
Plug 'tomasr/molokai'
Plug 'sonph/onehalf', { 'rtp': 'vim'  }
Plug 'ayu-theme/ayu-vim'  "light, mirage, dark
Plug 'lifepillar/vim-solarized8'  "set background=light/dark
Plug 'arcticicestudio/nord-vim'  "requires nord theme on terminal
Plug 'tomasiser/vim-code-dark'  "codedark
Plug 'mhartington/oceanic-next'  "OceanicNext
Plug 'sainnhe/sonokai'  "Sonokai
call plug#end()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""" Plugin-specific settings """"""""""""""""""""
"remap GoTo for YCM
nnoremap <leader>gt :YcmCompleter GoTo<CR>
"goto in split pane
nnoremap <leader>gtn :vertical split \| YcmCompleter GoTo<CR>
"manually trigger popup
nnoremap <leader>D <plug>(YCMHover)
let g:ycm_auto_hover="" "disable auto popup at cursor

nnoremap <leader>nt :NERDTreeToggle<CR> "shortcut to toggle NERDTree
"au VimEnter *  NERDTree  "toggle NERDTree by default

nnoremap <leader>tb :TagbarToggle<CR>

"press <leader>g for git message over cursor
map <silent><Leader>g :call setbufvar(winbufnr(popup_atcursor(systemlist("cd " . shellescape(fnamemodify(resolve(expand('%:p')), ":h")) . " && git log --no-merges -n 1 -L " . shellescape(line("v") . "," . line(".") . ":" . resolve(expand("%:p")))), { "padding": [1,1,1,1], "pos": "botleft", "wrap": 0 })), "&filetype", "git")<CR>

let g:lightline = {
\ 'colorscheme': 'Tomorrow_Night_Bright',
\ 'active': {
\   'left': [ [ 'mode', 'paste'  ],
\             [ 'readonly', 'filename', 'modified']],
\   'right': [ ['percent'],
\              ['fileencoding', 'filetype'],
\              ['gitbranch'] ],
\
\ },
\ 'component_function': {
\   'gitbranch': 'FugitiveHead'
\
\ },
\}


""" Colorscheme Pugin Settings """
"Sonokai colorscheme settings
let g:sonokai_style = 'andromeda'
let g:sonokai_enable_italic = 0
let g:sonokai_disable_italic_comment = 1

let g:molokai_original = 1
"let g:gruvbox_italic=1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


""""""""""""""""""" appearances """""""""""""""""""""""
set guifont=Roboto_Mono_Medium:h11  "when using gVim, terminal VIM uses whatever font the terminal uses
colorscheme gruvbox
set background=dark "Vim will try to use colors that suit a dark background
set termguicolors  "enable true colors support ( set `xterm-256color` for accurate colors )
"set term=screen-256color "enable to support colors for TMUX
set t_Co=256
" add `export TERM=xterm-256color` in .bashrc file

" enable italic comments
"let &t_ZH="\e[3m"
"let &t_ZR="\e[23m"
"highlight Comment cterm=italic

let ayucolor="mirage"
let g:rainbow_active = 1
"""""""""""""""""""""""""""""""""""""""""""""""""""""""
