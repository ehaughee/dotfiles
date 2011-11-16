" Turn on line numbering
set nu

" Turn on mouse support
set mouse=a
set ttymouse=xterm " Supposedly helps tmux in some way...

" Permanent status bar with different format
set laststatus=2
set statusline=\(%F%m%r%h%w\)\ %{&ff}\ %Y\ ASCII=\%03.3b\ HEX=\%02.2B\ POS=%04l,%04v\ %p%%\ LINES=%L 

" Allow Ctrl+PgUp/PgDn in tmux
set t_kN=[6;*~
set t_kP=[5;*~

" Set highlighting syntax on
syntax on

" Pick color scheme
colorscheme molokai

" Highlight alt syntax in strings
let php_htmlInStrings=1
let php_sql_query=1
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
