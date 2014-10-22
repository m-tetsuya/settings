function prompt-git-current-branch {
  local name st color
  
  name=`git symbolic-ref HEAD 2> /dev/null`
  if [[ -z $name ]]
  then
    return
  fi
  name=`basename $name`
  
  echo "%F{green}[$name]%f "
}

export LANG=ja_JP.UTF-8

# homebrewを優先
export PATH=/usr/local/share/npm/bin:/usr/local/mysql/bin:~/bin:/usr/local/bin:/usr/local/sbin:$PATH

zstyle ':completion:*' completer _expand _complete _ignored _correct _approximate
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' menu select=2
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' verbose true
zstyle ':completion:*:processes' menu yes select=2

#javac 文字化け回避
export JAVA_TOOL_OPTIONS="-Dfile.encoding=UTF-8 -XX:MaxPermSize=256m"

HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt appendhistory extendedglob notify
bindkey -e

autoload -U compinit
compinit

autoload -U colors; colors
setopt prompt_subst
export PROMPT='%B%{${fg[white]}%}[%n@%m] %/
`prompt-git-current-branch`%b%# '

# for Clojure
alias clj="java -cp ~/work/clojure-1.4.0/clojure-1.4.0.jar clojure.main"

case ${OSTYPE} in
  cygwin*)
    alias clj="java -cp c:/Users/S124123/work/clojure-1.4.0/clojure-1.4.0.jar clojure.main"

    zstyle :compinstall filename '/home/S124123/.zshrc'

    alias open=cygstart
    function open(){
      cscript //Nologo C:/usr/bin/open.js `cygpath -wd $@`
    }
  
    alias vim=vi
    cd
    ;;
  *)
    ;;
esac

# for svn
export SVN_EDITOR="vim --noplugin"  

# z
[[ -s ~/.autojump/etc/profile.d/autojump.zsh ]] && . ~/.autojump/etc/profile.d/autojump.zsh

[ -f ~/.zshrc.local ] && source ~/.zshrc.local

# rbenv
export PATH="$HOME/.rbenv/bin:$HOME/.rbenv/shims:$PATH"
eval "$(rbenv init -)"


### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
