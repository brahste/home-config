# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
export PATH=/usr/local/bin:$HOME/.bin:$HOME/.local/bin:$PATH

# Path to oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Export CUDA toolkit path
export PATH=/usr/local/cuda/bin${PATH:+:${PATH}}

# Export GO path
export PATH=$PATH:/usr/local/go/bin

# Export clang compilers
#export CC=/usr/bin/clang
#export CXX=/usr/bin/clang++

# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="powerlevel10k/powerlevel10k"

# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
  zsh-syntax-highlighting
  zsh-autosuggestions
  fzf
  nix-zsh-completions
  nix-shell
)

source $ZSH/oh-my-zsh.sh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
#-----
# User configuration

# Show nothing about user@comp on prompt
prompt_context() {}

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.

# Directory traversal aliases
alias cdv="cd ~/dev"

# Aliases for programs and applications
alias python="python3"
alias vim="nvim"
alias vpn="nordvpn"

# Listing aliases
alias ls="lsd"
alias ll="lsd -l"
alias la="lsd -la"
alias lt="lsd --tree"
alias lta="lsd --tree --all"

# Colouring aliases
alias watch="watch --color"
alias ip="ip -br --color"

# Alias for dotfile configuration management with git
alias cfg='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Custom ls colouring with vivid
export LS_COLORS="$(vivid generate molokai)"

# Configuration for node version manager (nvm)
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Shell hook for direnv
# Ref: https://direnv.net/docs/hook.html
eval "$(direnv hook zsh)"
