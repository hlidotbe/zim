#
# Custom aliases/settings
#
platform='unknown'
unamestr=`uname`
if [[ "$unamestr" == 'Linux' ]]; then
   platform='linux'
elif [[ "$unamestr" == 'FreeBSD' ]]; then
   platform='freebsd'
elif [[ "$unamestr" == 'Darwin' ]]; then
   platform='darwin'
fi

# any custom stuff should go here.
# ensure that 'custom' exists in the zmodules array in your .zimrc

alias dh='dirs -v'
#alias g='git'
#alias gai='git add -v -i'
#alias gcp='git commit -v -p'
#alias gcpa='git commit -v -p -a'
#alias gitserve='git daemon --reuseaddr --export-all'
#alias gl="git log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --"
#alias gla="git log -1 --pretty='%s'"
#alias gm='git merge --no-ff'
#alias gp='git push --follow-tags'
#alias grb='git rebase -p'
#alias gru='git rebase @{u}'
alias gst=gwS
#alias gup='git up'
alias k='kill -9'
if [[ $platform == 'linux' ]]; then
  alias ls='ls --color --group-directories-first'
elif [[ $platform == 'freebsd' || $platform == 'darwin' ]]; then
  alias ls='/usr/local/bin/gls --color --group-directories-first'
fi
alias man='LC_ALL=C LANG=C man'
alias r='bundle exec rake'
alias rd='bundle exec rake device'
alias tags='git tag | sort -V'
alias tail='less +F'
alias tl='tmux list-sessions'
alias top='/usr/bin/top -ocpu -R -F -s 2 -n30'
alias v='nvim'
alias vdiff='nvim -d'
alias vim='nvim'
alias vimdiff='nvim -d'
alias gt='gittower'

alias t=tmux_setup
alias gon=go_workon
alias goff=go_end

PAGER="less"
EDITOR='nvim'
JS_CMD='node'
GEMS_PATH=`gem env | grep "INSTALLATION DIRECTORY" | sed -e 's/.*- INSTALLATION DIRECTORY: //'`

export EDITOR
export JS_CMD
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export PAGER
export GEMS_PATH
export PATH="$HOME/bin:$HOME/.composer/vendor/bin:$HOME/.local/bin:$HOME/.gem/ruby/2.1.0/bin:$PATH"

if [[ -f /usr/share/autojump/autojump.sh ]]; then
  source /usr/share/autojump/autojump.sh;
elif [[ -s $(brew --prefix)/etc/profile.d/autojump.sh ]]; then
  source $(brew --prefix)/etc/profile.d/autojump.sh;
fi


zstyle -s ':completion:*:hosts' hosts _ssh_config
[[ -r ~/.ssh/config  ]] && _ssh_config+=($(cat ~/.ssh/config | sed -ne 's/Host[=\t ]//p'))
zstyle ':completion:*:hosts' hosts $_ssh_config

if [[ $platform == 'darwin' ]]; then
  alias man=dash_man
  BASE16_SHELL="$HOME/.config/base16-shell/base16-tomorrow.dark.sh"
  [[ -s $BASE16_SHELL  ]] && source $BASE16_SHELL
  # Quick way to rebuild the Launch Services database and get rid
  # of duplicates in the Open With submenu.
  alias fixopenwith='/System/Library/Frameworks/CoreServices.framework/Frameworks/LaunchServices.framework/Support/lsregister -kill -r -domain local -domain system -domain user && killall Finder'
  [[ -f ~/.dircolors ]] && eval `gdircolors ~/.dircolors`
else
  [[ -f ~/.dircolors ]] && eval `dircolors ~/.dircolors`
fi

bindkey -e
bindkey '^R' history-incremental-search-backward
