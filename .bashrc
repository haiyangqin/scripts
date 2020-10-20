# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

LM_LICENSE_FILE=/opt/modelsim/mentor_lic_10.2c.dat
export LM_LICENSE_FILE


#export PATH=~/bin:$PATH

export HOSTNAME=ucsoc-001
export PATH=$PATH:/opt/Xilinx/Vivado/2017.4/bin
export PATH=$PATH:/opt/modelsim/modeltech/linux_x86_64
export PATH=$PATH:/opt/MATLAB/R2016b/bin
export PATH=$PATH:/opt/mips-4.3/bin
export PATH=$PATH:/opt/pulpino/bin
export PATH=$PATH:/opt/codelite/bin
export PATH=$PATH:/opt/Xilinx/Vivado/2017.2/bin
export LC_ALL="C"
export XILINX_VIVADO=/opt/Xilinx/Vivado/2017.4
#synopsys
export SYNOPSYS=/usr/synopsys
#uvm
export UVM_HOME=$SYNOPSYS/uvm-1.1d
#vcs
export VCS_HOME=$SYNOPSYS/vcs-mx/L-2016.06
export PATH=$PATH:$VCS_HOME/bin
#dve
export DVE_HOME=$VCS_HOME/gui/dve
export PATH=$PATH:$DVE_HOME/bin:$VCS_HOME/bin
#verdi
export VERDI_HOME=$SYNOPSYS/verdi/Verdi3_L-2016.06-1
export NOVAS_HOME=$SYNOPSYS/verdi/Verdi3_L-2016.06-1
export FSDB_HOME=$VERDI_HOME/share/PLI/VCS/LINUX64
export PATH=$PATH:$VERDI_HOME/bin:$VERDI_HOME/platform/LINUX64/bin
#export LD_LIBRARY_PATH=$VERDI_HOME/bin:$FSDB_HOME:$PATH
export LD_LIBRARY_PATH=$VERDI_HOME/share/PLI/VCS/LINUX64
#scl
export SCL_HOME=$SYNOPSYS/scl/2018.06
export PATH=$PATH:$SCL_HOME/linux64/bin
export SNPSLMD_LICENSE_FILE=27000@$HOSTNAME
#export LM_LICENSE_FILE=27000@$HOSTNAME
export VCS_ARCH_OVERRIDE=linux
export VCS_TARGET_ARCH=amd64
#export DISPLAY=unix:0
alias vcs64="vcs -full64"
alias verdi64="verdi -full64 &"
alias dve64="dve -full64 &"
#alias lmli2="lmgrd -c $SYNOPSYS/Synopsys.dat -l $SYNOPSYS/lmgrd.log"
alias lmli2="sudo /usr/synopsys/scl/2018.06/linux64/bin/lmgrd -c $SYNOPSYS/Synopsys.dat"
alias cd3="cd ../../../ "
alias cd2="cd ../../"


#source /opt/Xilinx/Vivado/2017.4/settings64.sh

###############################################
##### User specific aliases and functions #####
###############################################

####### user's function ##################
###############################################
####linux####
##cd_ll
cd_ll()
{
   \cd $1;
   if [ $? -eq 0 ]; then #if the dir is existed,then list its content
     ll;
   fi
}

##PS1
export PS1="[\t][\`pwd\`]"

####### command alias   ##################
###############################################
####linux####
##common
alias cd='cd_ll'
alias cd2='cd ../../'
alias cd3='cd ../../../'

alias cp='cp -i'

alias fn="find -name $1"
alias fg="find -name $1 * | xargs grep -nr $2"

alias gn="grep -nr $1"

alias ls="ls --color -l"
alias ll="ls -aIF $1 -rt"
alias lns="ln -s"

alias sb="source ~/.bashrc"

##net
alias close_net="sudo ip route del default"
alias open_net="sudo ip route add default via 192.168.99.1 dev eth0"

##gvim
alias g="gvim"
alias gd="g -d"
alias gb="gvim ~/.bashrc"

##git
alias gt="git"
alias gtco="gt checkout"
alias gtl="gt log --all --graph --decorate --oneline"
alias gtdl="gtl -p"
alias gtrv="gt remote -v"
alias gtb="gt branch"
alias gtba="gtb -a"
alias gti="gt init"
alias gts="gt status"
alias gta="gt add"
alias gtd="gt diff"
alias gtdn="git diff --name-only"
alias gtcm="gt commit -m"
alias gtca="gt commit -a"
alias gtm="gt merge"
alias gtp="gt push"
alias gtr="gt reset HEAD"
alias gtcl="gt clone"
alias gtpo="gt push origin"
