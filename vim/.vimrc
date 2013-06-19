if filereadable($HOME . '.vimrc.local')
  source $HOME/.vimrc.local
endif

if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim.git

  call neobundle#rc(expand('~/.vim/bundle'))
endif

let g:neobundle_default_git_protocol='https'
NeoBundle 'Shougo/neobundle.vim.git'
NeoBundle 'Shougo/echodoc.git'
NeoBundle 'Shougo/neocomplcache.git'
NeoBundle 'Shougo/vimproc.git'
NeoBundle 'Shougo/unite.vim.git'
NeoBundle 'Shougo/vim-vcs.git'
NeoBundle 'Shougo/vimfiler.git'
NeoBundle 'Shougo/vimshell.git'
NeoBundle 'Shougo/vinarise.git'
NeoBundle 'tpope/vim-surround.git'
NeoBundle 'derekwyatt/vim-scala.git'
NeoBundle 'thinca/vim-quickrun.git'
NeoBundle 'kchmck/vim-coffee-script'
NeoBundle 'ujihisa/shadow.vim'
NeoBundle 'jondistad/vimclojure'
NeoBundle 'mattn/zencoding-vim.git'

let g:neocomplcache_enable_at_startup = 1
imap <C-k> <Plug>(neocomplcache_snippets_expand)
smap <C-k> <Plug>(neocomplcache_snippets_expand)

" For VimClojure
let vimclojure#WantNailgun = 1
let vimclojure#NailgunClient = "ng"

au FileType javascript set ts=2 sw=2 expandtab
au FileType css set ts=2 sw=2 expandtab
au FileType java set ts=4 sw=4 expandtab
au BufNewFile *.js set ft=javascript

set encoding=utf-8
set termencoding=utf-8
set fileformat=unix
set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2
set hlsearch
set fileencoding=utf-8
set fenc=utf-8
set number
set hidden
set incsearch
set autoindent
set nocompatible
set ambiwidth=double

colorscheme darkblue

syntax on
filetype on
filetype indent on
filetype plugin on

"XML閉じタグ補完
augroup MyXML
  autocmd!
  autocmd Filetype xml inoremap <buffer> </ </<C-x><C-o>
  autocmd Filetype html inoremap <buffer> </ </<C-x><C-o>
augroup END

"run vimfiler form unite
call unite#custom_default_action('source/bookmark/directory' , 'vimfiler')
let g:vimfiler_as_default_explorer=1
let g:vimfiler_safe_mode_by_default=0
command Ub Unite bookmark
command Vf VimFiler
command Vs VimFiler -split -simple -winwidth=35 -no-quit 


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

  set clipboard+=unnamed

"全ての標準Javaクラスのハイライトを有効に
  :let java_highlight_all=1

  :source $VIMRUNTIME/macros/matchit.vim

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

  cd ~/

elseif has('mac')

  " MacVimでのleader設定
  map ¥ <leader>

endif

" バッファ切り替えを容易に
map <C-J> :bprev<CR>
map <C-K> :bnext<CR>
map <C-L> :tabn<CR>
map <C-H> :tabp<CR>

" %でタグ対応タグの移動機能追加
source $VIMRUNTIME/macros/matchit.vim

