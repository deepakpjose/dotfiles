# Generic $dotdir/bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
        . ~/.bashrc
fi

# User specific environment and startup programs
[ -z "$HOSTNAME" ] && HOSTNAME=`uname -n`
keychain -q ~/.ssh/id_rsa
if [[ -e ~/.keychain/${HOSTNAME}-sh ]]; then
    . ~/.keychain/${HOSTNAME}-sh
else
    . ~/.ssh-agent-${HOSTNAME}
fi
