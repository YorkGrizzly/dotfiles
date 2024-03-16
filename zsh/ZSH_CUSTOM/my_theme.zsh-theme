# Sim-link this file under $ZSH/themes/

PROMPT='%{$fg[white]%}%M %{$fg_bold[red]%}%(!.%{$fg[red]%}.%{$fg[green]%})%~$(git_super_status)%{$reset_color%} '
RPROMPT=''

ZSH_THEME_GIT_PROMPT_PREFIX=" %{$fg_bold[blue]%}("
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$fg_bold[blue]%})"
ZSH_THEME_GIT_PROMPT_DIRTY=" %{$fg[red]%}✗"
ZSH_THEME_GIT_PROMPT_CLEAN=" %{$fg[green]%}✔"
