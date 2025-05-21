local return_code="%(?..%{$fg[red]%}%? ↵%{$reset_color%})"
local user_host="%B%(!.%{$fg[red]%}.%{$fg[green]%})%n@%m%{$reset_color%} "
local user_symbol='%(!.#.$)'
local current_dir="%B%{$fg[blue]%}%~ %{$reset_color%}"

ros_version_info () {
	if (( ${+ROS_DISTRO} )); then
          echo "%{$fg[magenta]%}‹󱗼 ${ROS_DISTRO}› %{$reset_color%}"
	fi
}

rob_folders_prompt_info () {
	if (( ${+ROB_FOLDERS_ACTIVE_ENV} )); then
          echo "%{$fg[cyan]%}‹󰭆 ${ROB_FOLDERS_ACTIVE_ENV}› %{$reset_color%}"
	fi
}

conda_info () {
	if (( ${+CONDA_DEFAULT_ENV} )); then
          echo "%{$fg[green]%}‹ ${CONDA_DEFAULT_ENV}› %{$reset_color%}"
	fi
}


docker_info () {
  if [[ -f /.dockerenv ]]; then
          echo "🐳 "
  else
          echo ""
  fi
}


local vcs_branch='$(git_prompt_info)$(hg_prompt_info)'
local rvm_ruby='$(ruby_prompt_info)'
local venv_prompt='$(virtualenv_prompt_info)'
local rob_folders_prompt='$(rob_folders_prompt_info)'
local ros_version_prompt='$(ros_version_info)'
local conda_env_prompt='$(conda_info)'
local docker_info_prompt='$(docker_info)'

ZSH_THEME_RVM_PROMPT_OPTIONS="i v g"

PROMPT="╭─${user_host}${docker_info_prompt}${current_dir}${rvm_ruby}${vcs_branch}${venv_prompt}${conda_env_prompt}${ros_version_prompt}${rob_folders_prompt}
╰─%B${user_symbol}%b "
RPROMPT="%B${return_code}%b"

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[yellow]%}‹󰊢 "
ZSH_THEME_GIT_PROMPT_SUFFIX="› %{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[red]%}●%{$fg[yellow]%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[yellow]%}"

ZSH_THEME_HG_PROMPT_PREFIX="$ZSH_THEME_GIT_PROMPT_PREFIX"
ZSH_THEME_HG_PROMPT_SUFFIX="$ZSH_THEME_GIT_PROMPT_SUFFIX"
ZSH_THEME_HG_PROMPT_DIRTY="$ZSH_THEME_GIT_PROMPT_DIRTY"
ZSH_THEME_HG_PROMPT_CLEAN="$ZSH_THEME_GIT_PROMPT_CLEAN"

ZSH_THEME_RUBY_PROMPT_PREFIX="%{$fg[red]%}‹ "
ZSH_THEME_RUBY_PROMPT_SUFFIX="› %{$reset_color%}"

ZSH_THEME_VIRTUAL_ENV_PROMPT_PREFIX="%{$fg[green]%}‹ "
ZSH_THEME_VIRTUAL_ENV_PROMPT_SUFFIX="› %{$reset_color%}"
ZSH_THEME_VIRTUALENV_PREFIX="$ZSH_THEME_VIRTUAL_ENV_PROMPT_PREFIX"
ZSH_THEME_VIRTUALENV_SUFFIX="$ZSH_THEME_VIRTUAL_ENV_PROMPT_SUFFIX"
