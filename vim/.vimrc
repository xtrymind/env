" Vim Plug
call plug#begin()

Plug 'airblade/vim-gitgutter'

Plug 'tpope/vim-fugitive'

Plug 'ntpeters/vim-better-whitespace'

Plug 'vivien/vim-linux-coding-style'

call plug#end()

" Special indenting for C and Makefiles (since most will be kernel files)
filetype plugin indent on

" Status line
set laststatus=2                            " Always show status line
set statusline=
set statusline+=%f                          " Show relative path of file being edited
set statusline+=\ %{fugitive#statusline()}  " Show git branch if applicable
set statusline+=%=                          " Column break
set statusline+=\ %l\:%v                    " Show line and column
set statusline+=\ \(%p%%\)                  " Show location of cursor location percentage

syntax enable                               " Enable syntax processing
set tabstop=4                               " Show tabs as four spaces
set softtabstop=4                           " When hit, tab = 4 spaces
set shiftwidth=4                            " When indenting with '>', use 4 spaces width
set expandtab                               " Hitting tab generates four spaces
set number                                  " Show line numbers when editing
set showcmd                                 " Show last command
set cursorline                              " Show current selected line
set wildmenu                                " Show auto completion menu when typing commands
set incsearch                               " Show search results in realtime
set hlsearch                                " Highlight search matches
set lazyredraw                              " Redraw only when we need to
set mouse=a                                 " Enable mouse in all modes

" Toggle color column
function! TglCC()
    if(&colorcolumn == 80)
        set colorcolumn=0
    else
        set colorcolumn=80
    endif
endfunc

" Vim updatetime for gitgutter
set updatetime=100

" Vim colorscheme
colorscheme cobalt

