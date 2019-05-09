" use vim settings, rather than vi settings
" must be first, because it changes other options as a side effect
set nocompatible

" stop unnecessary rendering
set lazyredraw

" Turn on line numbering. Turn it off with "set nonu"
set number

" Set syntax on
syntax on

" Higlhight search
set hls

" show matching brackets/parenthesis
set showmatch

" Wrap text instead of being on one line
set lbr

""""" Indent
" Enable file type detection.
filetype indent on
set expandtab shiftwidth=2 softtabstop=2

" Special indent for python
autocmd FileType python setlocal shiftwidth=4 tabstop=4

""" Disable mouse visual mode
set mouse=""

""" Shift-tab for 'de-tab'
nnoremap <S-Tab> <<
inoremap <S-Tab> <C-d>

" Automatically remove trailing spaces
autocmd BufWritePre * :%s/\s\+$//e

