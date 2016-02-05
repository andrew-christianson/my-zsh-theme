# PROMPT="[%*] %n:%c $(git_prompt_info)%(!.#.$) "
PROMPT='%{$fg[green]%}[%*]%{$reset_color%} %{$fg[magenta]%}::%{$reset_color%} %{$fg[cyan]%}%n%{$reset_color%} %{$fg[magenta]%}::%{$reset_color%} %{$fg[red]%}%m%{$reset_color%} %{$fg[magenta]%}::%{$reset_color%} %{$fg[green]%}$(sed -e "s:/Users/andrew.christianson:~:g" -e "s:/Users/andrew:~:g" -e "s:/home/andrew:~:g" -e"s:\([^/]\)[^/]*/:\1/:g" <<< $(pwd))%{$reset_color%}$(git_prompt_info) %{$fg[magenta]%}%(!.#.λ)%{$reset_color%} '

ZSH_THEME_GIT_PROMPT_PREFIX=" %{$fg[yellow]%}git:("
ZSH_THEME_GIT_PROMPT_SUFFIX=")%{$reset_color%}"
# elaborate exitcode on the right when >0
return_code_enabled="%(?..%{$fg[red]%}%? ↵%{$reset_color%})"
return_code_disabled=
return_code=$return_code_enabled

RPS1='${return_code}'

function accept-line-or-clear-warning () {
    if [[ -z $BUFFER ]]; then
	time=$time_disabled
        return_code=$return_code_disabled
    else
        time=$time_enabled
        return_code=$return_code_enabled
    fi
    zle accept-line
}
zle -N accept-line-or-clear-warning
bindkey '^M' accept-line-or-clear-warning
