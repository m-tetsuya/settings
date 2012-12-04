if filereadable($HOME . '.vimrc.local')
  source $HOME/.vimrc.local
endif

if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim.git

  call neobundle#rc(expand('~/.vim/bundle'))
endif

"NeoBundle 'Shougo/clang_complete.git'
NeoBundle 'Shougo/echodoc.git'
NeoBundle 'Shougo/neocomplcache.git'
NeoBundle 'Shougo/neobundle.vim.git'
NeoBundle 'Shougo/unite.vim.git'
NeoBundle 'Shougo/vim-vcs.git'
NeoBundle 'Shougo/vimfiler.git'
NeoBundle 'Shougo/vimshell.git'
NeoBundle 'Shougo/vinarise.git'
NeoBundle 'tpope/vim-surround.git'
NeoBundle 'ujihisa/quickrun.git'
NeoBundle 'derekwyatt/vim-scala.git'

let g:neocomplcache_enable_at_startup = 1

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
set number
set hidden
set incsearch
set autoindent
set nocompatible

colorscheme darkblue

syntax on
filetype on
filetype indent on
filetype plugin on

if has('win32')
  if has('gui_running')
    source C:\Program Files\Vim\vimfiles\etc\encode.vim
  else
    source /cygdrive/c/Program\ Files/Vim/vimfiles/etc/encode.vim
  endif

  augroup SkeletonAu
    autocmd!
    autocmd BufNewFile *.html 0r C:\Program Files\Vim\vimfiles\templates\skel.html
  augroup END
  au GUIEnter * simalt ~x

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


  set autoread
  augroup vimrc-checktime
    autocmd!
    autocmd WinEnter * checktime
  augroup END

elseif has('mac')

  " MacVimでのleader設定
  map ¥ <leader>

endif
