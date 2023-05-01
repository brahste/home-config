# Depends on the git plugin for work_in_progress()
(( $+functions[work_in_progress] )) || work_in_progress() {}

ZSH_THEME_GIT_PROMPT_PREFIX="%{$reset_color%}%{$fg[green]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[red]%}*%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN=""

# Customized git status, oh-my-zsh currently does not allow render dirty status before branch
git_custom_status() {
  local branch=$(git_current_branch)
  local shortened_branch=$(echo ${branch} | sed 's/\(.\{20\}\).*/\1…/')
  [[ -n "$branch" ]] || return 0
  echo "$(parse_git_dirty)\
%{${fg_bold[yellow]}%}$(work_in_progress)%{$reset_color%}\
${ZSH_THEME_GIT_PROMPT_PREFIX}${shortened_branch}${ZSH_THEME_GIT_PROMPT_SUFFIX}"
}

# Custom environment info
# env_custom_line() {
#   echo "%{$FG[137]%}${name}%{$reset_color%}"
# }
env_custom_line() {
    if ! [[ -z "${DIRENV_FILE}" ]]; then
      env_specifier=$(basename $(dirname $DIRENV_FILE))
      env_type="nix"
    fi
    echo "%{$FG[027]%}${env_type}%{$reset_color%}"
}

# Custom pathing as referenced in this post:
# https://unix.stackexchange.com/questions/273529/shorten-path-in-zsh-prompt
_PATH="%{$fg_bold[white]%}%(4~|%-1~/../%2~|%3~)%{$reset_color%}"

# Combine it all into a final right-side prompt
RPS1="\$(git_custom_status) \$(env_custom_line)${RPS1:+ $RPS1}"
PROMPT='%{$FG[033]%}$_PATH %(?.%{$fg[green]%}.%{$fg[red]%})%B$%b '
