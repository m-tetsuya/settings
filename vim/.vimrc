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
NeoBundle 'mattn/emmet-vim'
NeoBundle 'mileszs/ack.vim'
NeoBundle 'jcfaria/Vim-R-plugin'
NeoBundle 'ervandew/screen'
"NeoBundle 'scrooloose/syntastic.git'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'h1mesuke/unite-outline'
NeoBundle 'tpope/vim-fireplace'
NeoBundle 'davidhalter/jedi-vim'
NeoBundle 'joonty/vdebug.git'

let g:neocomplcache_enable_at_startup = 1
imap <C-k> <Plug>(neocomplcache_snippets_expand)
smap <C-k> <Plug>(neocomplcache_snippets_expand)

" For VimClojure
let vimclojure#WantNailgun = 1
let vimclojure#NailgunClient = "ng"
let g:clj_highlight_builtins = 1
let g:clj_paren_rainbow = 1

au FileType javascript set ts=2 sw=2 expandtab
au FileType css set ts=2 sw=2 expandtab
au FileType java set ts=4 sw=4 expandtab
au BufNewFile *.js set ft=javascript
au BufNewFile,BufRead *.cljs set filetype=clojure

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
set nobackup
set modeline
set modelines=5
set showmatch
set matchpairs& matchpairs+=<:>
set nowritebackup
set noswapfile
set novisualbell

" ステータスラインの表示
set statusline=%<     " 行が長すぎるときに切り詰める位置
set statusline+=%{fugitive#statusline()}  " git branch
set statusline+=\ \   " 空白スペース2個
set statusline+=[%n]  " バッファ番号
set statusline+=%m    " %m 修正フラグ
set statusline+=%r    " %r 読み込み専用フラグ
set statusline+=%h    " %h ヘルプバッファフラグ
set statusline+=%w    " %w プレビューウィンドウフラグ
set statusline+=%{'['.(&fenc!=''?&fenc:&enc).':'.&ff.']'}  " fencとffを表示
set statusline+=%y    " バッファ内のファイルのタイプ
set statusline+=\     " 空白スペース
if winwidth(0) >= 130
  set statusline+=%F    " バッファ内のファイルのフルパス
else
  set statusline+=%t    " ファイル名のみ
endif
set statusline+=%=    " 左寄せ項目と右寄せ項目の区切り
set statusline+=%{fugitive#statusline()}  " Gitのブランチ名を表示
set statusline+=\ \   " 空白スペース2個
set statusline+=%1l   " 何行目にカーソルがあるか
set statusline+=/
set statusline+=%L    " バッファ内の総行数
set statusline+=,
set statusline+=%c    " 何列目にカーソルがあるか
set statusline+=%V    " 画面上の何列目にカーソルがあるか
set statusline+=\ \   " 空白スペース2個
set statusline+=%P    " ファイル内の何％の位置にあるか

set laststatus=2

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
command Uo Unite -vertical -winwidth=40 -no-quit outline


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
"map <C-L> :tabn<CR>
"map <C-H> :tabp<CR>

" %でタグ対応タグの移動機能追加
source $VIMRUNTIME/macros/matchit.vim

" syntastic
let g:syntastic_mode_map = {
      \  'mode': 'active',
      \ 'passive_filetypes': ['html']
      \ }

if filereadable($HOME . '/.vimrc.local')
  source $HOME/.vimrc.local
endif

