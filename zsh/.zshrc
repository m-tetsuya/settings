export LANG=ja_JP.UTF-8

# homebrewを優先
export PATH=~/bin:/usr/local/bin:$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
# rvm
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"

autoload -U compinit
compinit

#javac 文字化け回避
export JAVA_TOOL_OPTIONS=-Dfile.encoding=UTF-8

