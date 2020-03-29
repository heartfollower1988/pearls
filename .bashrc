# .bashrc

alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

# Source global definitions
if [ -f /etc/bashrc ]; then
        . /etc/bashrc
fi

# User specific aliases and functions

set -o vi
ulimit -c unlimited

alias vi=vim
alias svnd="svn st | grep '^[MA]' --color"
alias mantmux="man M /home/xx/local/share/man/man1/tmux.1"
alias grep='grep --color'
alias find='find . -name'
alias topcao='top -ucaoguanlong'
alias tf='tail -f'
alias mg='grep -rnIi --color'

mgp() 
{
    grep -rnIi --color "$1" "${2:-.}";
}

alias mscp=~/mscp.sh
alias rep=~/rep.sh

# sandbox
alias server='cd /export/home/caoguanlong/work/sandbox_server'
alias gs='cd /export/home/caoguanlong/work/sandbox_server/gameserver/gs'
alias gde='cd /export/home/caoguanlong/work/sandbox_server/gdeliveryd'
alias dbs='cd /export/home/caoguanlong/work/sandbox_server/gamedbd'
alias dbc='cd /export/home/caoguanlong/work/sandbox_server/gdbclient'
alias link='cd /export/home/caoguanlong/work/sandbox_server/glinkd'
alias gamed='cd /export/home/caoguanlong/work/sandbox_server/gamed'
alias build='cd /export/home/caoguanlong/work/sandbox_server/build'
alias run='cd /export/home/caoguanlong/work/sandbox_server/build/run/'
alias data='cd /export/home/caoguanlong/work/sandbox_server/build/run/config/common/data'
alias cmd='vi /export/home/caoguanlong/work/sandbox_server/gameserver/gs/cmds/cmds.xml'
alias rpc='vi /export/home/caoguanlong/work/sandbox_server/rpcalls.xml'
alias err='vi /export/home/caoguanlong/work/sandbox_server/share/rpc/errcodedefine.h'
alias cmake2='CC="distcc gcc" CXX="distcc g++" cmake'
alias tag='/export/home/caoguanlong/work/ctags/ctags.sh'
alias mi='./mymake install -j40'

export PS1="\[\e[32m\][#\##\[\e[31m\]\u\[\e[32m\]@\[\e[31m\]\h \[\e[35m\]\w\[\e[32m\]]$\[\e[m\]"


# make vim not overwrite the content in window after vim exits
export TERM=xterm

