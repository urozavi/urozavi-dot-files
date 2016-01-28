# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias dir='dir --color=auto'
    alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

alias ll='ls -l'
alias la='ls -la'
alias l='ls -CF'
alias s="clear && git status"
alias l="clear && git log --oneline --graph --decorate --all"
alias d="clear && git diff "
alias ctags="ctags -R --fields=+aimS --languages=php --PHP-kinds=+cf --regex-php='/^[ \t]*trait[ \t]+([a-z0_9_]+)/\1/t,traits/i'"
alias php="php -dzend_extension=/opt/xdebug-2.4.0RC3/modules/xdebug.so"
alias mta2="multitail -M 0 /var/log/apache2/access.log -I /var/log/apache2/error.log"
