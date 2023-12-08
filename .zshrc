ZSH_THEME="powerlevel10k/powerlevel10k"
# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
export EDITOR=nvim
# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
#ZSH_THEME="robbyrussell"

#POWERLEVEL9K_BACKGROUND_JOBS_FOREGROUND='black'

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
#DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
		git
		history-substring-search
		zsh-autosuggestions
		colored-man-pages
		zsh-syntax-highlighting
		pip
    zsh-proxy
)

source $ZSH/oh-my-zsh.sh

#alias ls='ls --color=auto'
alias grep='grep --colour=auto'
alias egrep='egrep --colour=auto'
alias fgrep='fgrep --colour=auto'
alias vim='nvim'

alias ls="exa"
alias ll="exa -alh"
alias tree="exa --tree"
alias yo='sudo pacman -Sy && sudo powerpill -Su && paru -Su'
alias gps='git push'
alias gas='aic && gps'
alias youtube-dl='yt-dlp'
#alias cat="bat"
# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
#export PATH=/home/pi/.local/bin:$PATH
#export PATH=/home/dakai/.local/bin:$PATH
#export PATH="$HOME/.local/bin:$PATH"
eval $(thefuck --alias)


export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

#pactl load-module module-raop-discover #Fedora enable shair-port discovery
#android cmd-line tools
export ANDROID_SDK_ROOT=$HOME/android
export PATH=$PATH:$ANDROID_SDK_ROOT/cmdline-tools/latest/bin:$ANDROID_SDK_ROOT/cmdline-tools/tools/bin
#ref: https://stackoverflow.com/questions/60440509/android-command-line-tools-sdkmanager-always-shows-warning-could-not-create-se

# bun completions
[ -s "$HOME/.bun/_bun" ] && source "$HOME/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
export JAVA_HOME=/usr/lib/jvm/java-11-openjdk

# bun completions
#[ -s "/Users/dakai/.bun/_bun" ] && source "/Users/dakai/.bun/_bun"

#npm global packages
NPM_PACKAGES="${HOME}/.npm-global"

export PATH="$PATH:$NPM_PACKAGES/bin"

# Preserve MANPATH if you already defined it somewhere in your config.
# # Otherwise, fall back to `manpath` so we can inherit from `/etc/manpath`.
#export MANPATH="${MANPATH-$(manpath)}:$NPM_PACKAGES/share/man"

export GRADLE_USER_HOME="$HOME/.gradle"

#alacritty hack for blur (X11 only)
#if [[ $(ps --no-header -p $PPID -o comm) =~ '^alacritty$' ]]; then
#        for wid in $(xdotool search --pid $PPID); do
#            xprop -f _KDE_NET_WM_BLUR_BEHIND_REGION 32c -set _KDE_NET_WM_BLUR_BEHIND_REGION 0 -id $wid; done
#fi
blur_alacritty_windows() {
    for pid in $(ps -C alacritty -o pid= | xargs); do
        for wid in $(xdotool search --pid $pid); do
            xprop -f _KDE_NET_WM_BLUR_BEHIND_REGION 32c \
            -set _KDE_NET_WM_BLUR_BEHIND_REGION 0 -id $wid
        done
    done
}

blur_alacritty_windows

#Wayland fix for flameshot
# export QT_SCREEN_SCALE_FACTORS="1;1"

function lg() {
    git add .
    git commit -a -m "$1"
    git push
}

function aic() {
    git add .
   	aicommits
}

function pgas() {  # Proxychains  Git add, Ai Commits, git push
  proxychains git add .
  proxychains aicommits
  proxychains git push
}
bindkey "^[l" forward-char
bindkey "^[h" backward-char
bindkey "^[k" history-substring-search-up
bindkey "^[j" history-substring-search-down
#foot integration
#function osc7 {
#    local LC_ALL=C
#    export LC_ALL
#
#    setopt localoptions extendedglob
#    input=( ${(s::)PWD} )
#    uri=${(j::)input/(#b)([^A-Za-z0-9_.\!~*\'\(\)-\/])/%${(l:2::0:)$(([##16]#match))}}
#    print -n "\e]7;file://${HOSTNAME}${uri}\e\\"
#}
#add-zsh-hook -Uz chpwd osc7
export DENO_INSTALL="$HOME/.deno"
export PATH="$DENO_INSTALL/bin:$PATH"
#source '/usr/share/zsh/plugins/zsh-thefuck-git/zsh-thefuck.plugin.zsh'
export PATH="$HOME/.config/composer/vendor/bin:$PATH"

#noproxy
