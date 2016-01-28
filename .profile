# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	    . "$HOME/.bashrc"
    fi

    # include the completion for wp-cli
    if [ -f "$HOME/.wp-completion.bash" ]; then
      . "$HOME/.wp-completion.bash"
    fi

    # include the completion for git
    if [ -f "$HOME/.git-completion.bash" ]; then
      . "$HOME/.git-completion.bash"
    fi

    # include npm completion
    if [ -f "$HOME/.npm-completion.bash" ]; then
      . "$HOME/.npm-completion.bash"
    fi

    # include composer completion
    if [ -f "$HOME/.composer-completion.bash" ]; then
      . "$HOME/.composer-completion.bash"
    fi
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi
