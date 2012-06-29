" Vundle
set rtp+=~/.vim/bundle/vundle
call vundle#rc()

Bundle 'gmarik/vundle'
Bundle 'wincent/Command-T.git'
Bundle 'argtextobj.vim'
"Bundle 'AutoClose'
"Bundle 'Raimondi/delimitMate'
"Bundle 'ClosePairs'
Bundle 'Auto-Pairs'
Bundle 'bkad/CamelCaseMotion'
Bundle 'sickill/vim-pasta'
Bundle 'tpope/vim-surround'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'Lokaltog/vim-powerline'
Bundle 'scrooloose/syntastic'
Bundle 'scrooloose/nerdcommenter'
Bundle 'scrooloose/nerdtree'
Bundle 'ervandew/supertab'
Bundle 'vim-scripts/superSnipMate'

" delimitMate Settings
let delimitMate_balance_matchpairs = 1
let delimitMate_expand_cr = 1
let delimitMate_expand_space = 1

" Turn on line numbering
set nu

" Turn off vi-compatibility
set nocompatible

" Make Esc work faster
set ttimeoutlen=50

" Turn on mouse support
set mouse=a
set ttymouse=xterm " Supposedly helps tmux in some way...

" Permanent status bar with different format
set laststatus=2
"set statusline=\(%F%m%r%h%w\)\-%{fugitive#statusline()}\ %{&ff}\ %Y\ ASCII=\%03.3b\ POS=%04l,%04v\ %p%%\ LINES=%L 

" Allow Ctrl+PgUp/PgDn in tmux
set t_kN=[6;*~
set t_kP=[5;*~

" Set highlighting syntax on
syntax on

" Pick color scheme
colorscheme molokai
set background=dark

" Highlight conflict markers
match ErrorMsg '^\(<\|=\|>\)\{7\}\([^=].\+\)\?$'

" TabMan settings
let g:tabman_side ='left'
let g:tabman_number = 0 " Don't show line numbers in tabman window
let g:tabman_width = 20

" AutoComplPop Options
let g:acp_mappingDriven = 0
let g:acp_completeoptPreview = 0

" Highlight alt syntax in strings
let php_htmlInStrings=1
let php_sql_query=1

" Folding
let php_folding=1

" Indent automatically depending on filetype
filetype plugin on
filetype indent on
set autoindent

" Enable 256 colors
set t_Co=256

" Enable ruler
set ruler

" Allow backspacing in more places
set backspace=start,indent,eol

" Set tab width to 4
set smarttab
set smartindent
set tabstop=4
set shiftwidth=4
set expandtab

" wildmenu
set wildmode=longest:full
set wildmenu

" Open new 'buffers' to the right and below
set splitright
set splitbelow

" Start scrolling # lines before vertical border of the window
set sidescrolloff=3

" Show all changes
set report=0

" Powerline settings
let g:Powerline_symbols = 'fancy'
