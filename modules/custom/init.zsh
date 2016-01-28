#
# Custom aliases/settings
#

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
alias ls='ls --color --group-directories-first'
alias man='LC_ALL=C LANG=C man'
alias r='bundle exec rake'
alias rd='bundle exec rake device'
alias tags='git tag | sort -V'
alias tail='less +F'
alias tl='tmux list-sessions'
alias top='/usr/bin/top -ocpu -R -F -s 2 -n30'
alias v='nvim'
alias vdiff='nvimdiff'
alias vim='nvim'
alias vimdiff='nvimdiff'

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
export PATH="/var/www/bin:/var/www/.composer/vendor/bin:/var/www/.local/bin:/var/www/.gem/ruby/2.1.0/bin:$PATH"

source /usr/share/autojump/autojump.sh

zstyle -s ':completion:*:hosts' hosts _ssh_config
[[ -r ~/.ssh/config  ]] && _ssh_config+=($(cat ~/.ssh/config | sed -ne 's/Host[=\t ]//p'))
zstyle ':completion:*:hosts' hosts $_ssh_config

bindkey -e
bindkey '^R' history-incremental-search-backward
