#######################################################
# Harry Kim .bashrc file
#######################################################a
FULL_NAME="Harry Kim"
EMAIL="hkim@securitycompass.com"
GIT_BASE="${HOME}"

# On mac we use vim installed with Cellar/Brew
# We also want to change the default Java if present
if [ `echo "${OSTYPE}" | grep 'darwin'` ]; then
    alias vim=/usr/bin/vim
    #export JAVA_HOME=`/usr/libexec/java_home -v 1.8.0_60`
fi

# Add Local bin directory and ghar bin directory to path
export PATH=${PATH}:~/bin:${GIT_BASE}/ghar/bin

# Bash style tab completion for ghar
${GIT_BASE}/ghar/ghar-bash-completion.sh

# Use proper prompts for RHEL/Centos/Fedora boxes
parse_git_branch ()
{
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
export PROMPT_COMMAND='printf "\033]0;%s@%s:%s\007" "${USER}" "${HOSTNAME}" "${PWD/#$HOME/~}"'
PS1='\[\033[01;32m\]\u@\H:\[\033[01;34m\]\w\$\[\033[00m\] $(parse_git_branch) \[\033[01;34m\] \$'

# Some aliases
alias vi=vim

# Set colors for ls and CLI on Mac
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced

# Git config
git config --global user.name "Harry Kim"
git config --global user.email hkim@securitycompass.com
git config --global credential.helper cache # Set git to use the credential memory cache
git config --global credential.helper 'cache --timeout=3600' # Set the cache to timeout after 1 hour (setting is in seconds)
git config --global core.editor vim
git config --global push.default simple

# Ghar, store dotfiles in GIT
# Pull latest on each login
ghar pull > /dev/null
ghar install > /dev/null

# Run additional bashrc scipts or if .bashrc.d does not exist
# create .bashrc.d directory
# Only execute additional .bashrc scripts if they are secure, e.g. owned by the
# user that is starting bash and not writable by others
if [ -d "${HOME}/.bashrc.d" ]; then
    for script in $(find $HOME/.bashrc.d/ -type f -perm -g-xw,o-xw -user ${USER}); do
        source ${script}
    done
else
    mkdir ${HOME}/.bashrc.d && chmod 700 ${HOME}/.bashrc.d && chmod -R og-wrx ${HOME}/.bashrc.d
fi

# If base virtualenv exists we add it to path and source it
# venv="${HOME}/Virtualenvs/base"
# if [ -d "${venv}" ]; then
#     source "${venv}/bin/activate"
# fi

# Make sure SSH Agent forwarding is enables for linux
key_file=~/.ssh/id_rsa
[[ -z $(ssh-add -L | grep $key_file) ]] && ssh-add $key_file
