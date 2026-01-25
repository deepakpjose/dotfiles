# Generic $dotdir/bashshrc
#
##
# Things the user might wish to set.
export EDITOR=vim # Preferred editor.
export PRINTER=lp # Preferred printer.

##
# Should the full environment be set up even for non-interactive shells?
# Probably not but here is a variable to control it.
export FULLENV=false # 'true' or 'false'

##
# Should all paths (even NFS, which might hang) be set up at login?
# The alias "fullpath" is available to setup your full path.  It can
# also be used to change your path by changing USER_PATH above.
export FULLPATH=true # 'true' or 'false'

###########################################################################
# Everything above this line helps configure the environment.

###########################################################################
# Everything below this line is run for interactive shells.
# If you wish the full environment even in non-interactive
# shells set FULLENV above to 'true'.

umask 022                       # no write by group or other
export autologout=0             # disable autologout
export FIGNORE=".o"             # don't complete .o files
export HISTFILE=~/.bash_history # history file
export HISTFILESIZE=500         # history file size
export HISTSIZE=128             # save last 128 commands
export ignoreeof=10             # disable ^D for logout (up to 10)
set -C                          # disable redirect overwrite
set -b                          # enable immediate job notify
export PS1="\h:\W > "           # shell prompt format
set -o vi                       # set keybindings of vi to shell.

##
# Source other rc files after this line.
[ -f ~/.bashrc_LOB ] && . ~/.bashrc_LOB
[ -f ~/.bashrc_BU ] && . ~/.bashrc_BU
[ -f ~/.bashrc_USER ] && . ~/.bashrc_USER

#linux aliases:
alias echo_path="echo $PATH | tr ':' '\n'"
alias ls_d="ls -d */"
alias ps_tree='ps -auxwf'

#To map vi key mappings in cmd
set editing-mode vi
set keymap vi-command

shopt -s checkwinsize
parse_git_branch() {
  local var1=$(git symbolic-ref HEAD 2>/dev/null | sed 's/refs\/heads\///')
  if [ -z $var1 ]; then
    echo "(~polaris~)"
  else
    echo "($var1)"
  fi
}

export PS1="\\[\\e[0;35m\\][\\w]\\[\\e[0m\\]\\n\\[\\e[0;32m\\]\\u@$HOSTNAME\\[\\e[1;39m\\]\$(parse_git_branch)\\[\\e[0;32m\\]# \\[\\e[0m\\]"

[ -z "$HOSTNAME" ] && HOSTNAME=$(uname -n)
keychain -q ~/.ssh/id_rsa
. ~/.ssh-agent-${HOSTNAME}

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
