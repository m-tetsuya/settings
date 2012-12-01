if has('gui_running')
  source C:\Program Files\Vim\vimfiles\etc\encode.vim
else
  source /cygdrive/c/Program\ Files/Vim/vimfiles/etc/encode.vim
endif

filetype plugin indent on
au FileType javascript set ts=2 sw=2 expandtab
au FileType css set ts=2 sw=2 expandtab
au FileType java set ts=4 sw=4 expandtab
au BufNewFile *.js set ft=javascript

set encoding=utf-8
set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2
set hlsearch
set fenc=utf-8

augroup SkeletonAu
    autocmd!
    autocmd BufNewFile *.html 0r C:\Program Files\Vim\vimfiles\templates\skel.html
augroup END
au GUIEnter * simalt ~x

set hidden
set incsearch

set number

colorscheme darkblue
autocmd GUIEnter * simalt ~x

set clipboard+=unnamed

:let java_highlight_all=1
syntax on

:source $VIMRUNTIME/macros/matchit.vim

imap <C-k> <Plug>(neocomplcache_snippets_expand)
smap <C-k> <Plug>(neocomplcache_snippets_expand)

set iminsert=0
set imsearch=0
set guifont=Ricty:h14:cSHIFTJIS

:let MRU_Max_Entries=30
:let MRU_Window_Height=15

:au BufEnter * execute ":lcd " . expand("%:p:h")

let g:neocomplcache_enable_at_startup = 1

set autoread
augroup vimrc-checktime
  autocmd!
  autocmd WinEnter * checktime
augroup END

