autoload colors; colors;

export LSCOLORS="Gxfxcxdxbxegedabagacad"
setopt prompt_subst

ZSH_THEME_GIT_PROMPT_SUFFIX="]%{reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[red]%}*%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN=""

# show git branch/tag, or name-rev if on detached head
parse_git_branch() {
    (git symbolic-ref -q HEAD || git name-rev --name-only --no-undefined --always HEAD) 2>/dev/null
}

# show red star if there are uncommitted changes
parse_git_dirty() {
    if git diff-index --quiet HEAD 2> /dev/null; then
        echo "$ZSH_THEME_GIT_PROMPT_CLEAN"
    else
        echo "$ZSH_THEME_GIT_PROMPT_DIRTY"
    fi
}

# if in a git repo, show dirty indicator + git branch
git_custom_status() {
    local git_where="$(parse_git_branch)"
    [ -n "$git_where" ] && echo "$(parse_git_dirty)$ZSH_THEME_GIT_PROMPT_PREFIX${git_where#(refs/heads/|tags/)}$ZSH_THEME_GIT_PROMPT_SUFFIX"
}

PROMPT="%{$fg[cyan]%}%~% %(?.%{$fg[green]%}.%{$fg[red]%})%B$%b "
