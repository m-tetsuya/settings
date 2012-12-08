export LANG=ja_JP.UTF-8

# homebrewを優先
export PATH=~/bin:/usr/local/bin:$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
# rvm
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"

zstyle ':completion:*' completer _expand _complete _ignored _correct _approximate
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' menu select=2
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' verbose true

autoload -U compinit
compinit

#javac 文字化け回避
export JAVA_TOOL_OPTIONS=-Dfile.encoding=UTF-8

case ${OSTYPE} in
  cygwin*)

    zstyle :compinstall filename '/home/S124123/.zshrc'

    HISTFILE=~/.histfile
    HISTSIZE=1000
    SAVEHIST=1000
    setopt appendhistory extendedglob notify
    bindkey -e

    autoload colors
    colors
    export PROMPT="%B%{${fg[white]}%}[%n@%m] %/
%# %{${reset_color}%}%b"

    alias open=cygstart
    function open(){
    cscript //Nologo C:/usr/bin/open.js `cygpath -wd $@`
  }

  alias vim=vi
  cd
  ;;
esac

