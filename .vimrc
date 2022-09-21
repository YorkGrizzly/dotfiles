"Indentation Options
set autoindent "New lines inherit the indentation of previous lines
set expandtab "Convert tabs to spaces
filetype plugin indent on "Enable indentation rules, syntax highlighting that are file-type specific
set shiftwidth=4 "When shifting, indent using 4 spaces
set smarttab "Insert "tabstop" number of spaces when the "tab" key is pressed
set softtabstop=4 "Indent using 4 spaces
set tabstop=4 "Tab size is equal to 4 spaces

"Editing Options
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o  "Disable autocommenting on newline

"Search Options
set hlsearch "Enable search highlighting
set ignorecase "Ignore case when searching
set incsearch "Incremental search that shows partial matches
set smartcase "Automatically switch search to case-sensitive when search query contains an uppercase letter
set shortmess-=S "show search match counts

"Performance Options
set complete-=i "Limit the files searched for auto-completes

"Text Rendering Options
set display+=lastline "Always try to show a paragraph's last line
set encoding=utf-8 "Use an encoding that supports unicode
set linebreak "Avoid wrapping a line in the middle of a word
set scrolloff=1 "The number of screen lines to keep above and below the cursor (a large value causes the cursor to stay in the middle line when possible
syntax enable "Enable syntax highlighting
set wrap "Enable line wrapping (display on newline when line is full to prevent horizontal scrolling

"User Interface Options
set laststatus=2 "Always display the status bar
set ruler "Always show cursor position in status bar
set wildmenu "Display command line's tab complete options as a menu
set number "Show line numbers on the sidebar
set relativenumber "Show relative numbers to current line
set mouse=a "Enable mouse for scrolling and resizing
set title "set the window's title, reflecting the file currently being edited

"au VimEnter *  NERDTree  "toggle NERDTree by default


"Code Folding Options
"set foldmethod=indent "Fold based on indentation levels

"Miscellaneous Options
set backspace=indent,eol,start "Allow backspacing over indentation, line breaks and insertion start
"set confirm "Display a confirmation dialog when closing an unsaved file
set history=1000 "Increase the undo limit
"set noswapfile  "Disable swap files

set nocompatible "Enable enhancements and improvements of Vi




"KEY MAPPINGS
"remap esc, enter normal mode by typing two j (remember to remove trailing whitespace for following, else jumps)
imap jj <Esc>
"press 'J'/'K' in visual mode to move selected text down/up with autoformatting
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

"let mapleader="\" "set leader
nnoremap <leader>bo :vnew +setl\ buftype=nofile <bar> 0put =v:oldfiles <bar> nnoremap <lt>buffer> <lt>CR> :e <lt>C-r>=getline('.')<lt>CR><lt>CR><CR><CR>gg "browse old files in new tab with search and enter enabled


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
Plug 'preservim/nerdtree'
Plug 'yegappan/taglist' "taglist
Plug 'ctrlpvim/ctrlp.vim' "CtrlP fuzzy finder
Plug 'google/vim-searchindex' "show search counts greater than 99
Plug 'jlanzarotta/bufexplorer' "buffer explorer
Plug 'itchyny/lightline.vim' "lightline (status bar)

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

"colorschemes
Plug 'flazz/vim-colorschemes'  "All colorschemes
Plug 'dracula/vim',{'as':'dracula'}
Plug 'morhetz/gruvbox'
Plug 'tomasr/molokai'
Plug 'ayu-theme/ayu-vim'  "light, mirage, dark
Plug 'lifepillar/vim-solarized8'  "set backgroun=light/dark
"Tomorrow-Night
call plug#end()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""" Plugin-specific settings """"""""""""""""""""
nnoremap <leader>gt :YcmCompleter GoTo<CR> "remap GoTo for YCM

nnoremap <leader>tl :Tlist<CR>
let Tlist_Process_File_Always = 1 "process tags even when Tlist is off
let Tlist_Show_One_File = 1 "only show Tlist of current buffer

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


""""""""""""""""""" appearances """""""""""""""""""""""
set guifont=Roboto_Mono_Medium:h11  "when using gVim, terminal VIM uses whatever font the terminal uses
colorscheme gruvbox
set background=dark "Vim will try to use colors that suit a dark background
set termguicolors  "enable true colors support ( set `xterm-256color` for accurate colors )
set term=screen-256color "enable to support colors for TMUX
" add `export TERM=xterm-256color` in .bashrc file
let ayucolor="mirage"
let g:rainbow_active = 1
"""""""""""""""""""""""""""""""""""""""""""""""""""""""
