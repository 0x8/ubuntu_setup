" nullp0inter
" Creation: May 31, 2016
" Last Edit: May 31, 2016 10:10 PM
" .vimrc file
" configured for code
" configured for vim-latex
" for use in https://github.com/0x8/ubuntu_setup
" alter at your own risk. I have included comments.
" I am by no means an expert here, so Google will provide
"     far better answers than I can.

set nocompatible
filetype plugin on                              " Required for vim-latex

" Vim-LaTeX stuff
set grepprg=grep\ -nH\ $*
let g:tex_flavor = "latex"                      " Set tex_flavor to LaTeX
let g:Tex_DefaultTargetFormat="pdf"             " Compile in pdfLaTeX
let g:Tex_MultipleCompileFormats="pdf"          " Compile in pdfLaTeX

" Enable syntax-highlighting
syntax enable                                   " Enable syntax highlighting

" Folding
set foldmethod=syntax                           " Enable folding

" Indent options
set shiftwidth=4                                " Set number of spaces for auto-indent
set tabstop=4                                   " Tab is 4 spaces
set autoindent                                  " Enable auto-indenting
set cindent                                     " Indentation for C like files
set copyindent                                  " Copy indentation on auto-indent
set smarttab                                    " Insert tabs according to shiftwidth not tabstop
set expandtab                                   " Expand tabs into spaces. Delete leading " to enable
set shiftround                                  " Use multiples of shiftwidth when using '>' and '<'

" Extra options
set number                                      " Enable line numbers
set showmatch                                   " Show matching parenthesis
set history=1000                                " Enable a bigger history
set undolevels=1000                             " More levels of undo
set title                                       " Change terminal's title
set ls=2                                        " Show file name at bottom
set pastetoggle=<F2>                            " Press F2 in insert to enter paste mode which
                                                "    allows multi-line pasting

" Searching
set ignorecase                                  " Ignore case when searching for all lowercase
set smartcase                                   " ...Except when search includes caps
set hlsearch                                    " Highlight search terms
set incsearch                                   " Show matches as you type
