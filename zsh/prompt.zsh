# Thanks https://github.com/holman/dotfiles !

autoload colors && colors
setopt prompt_subst

# show current directory
directory_name() {
    #echo "%{$fg_bold[cyan]%}%1/%\/%{$reset_color%}"
    echo "%{$fg[cyan]%}%~% %(?.%{$fg[green]%}.%{$fg[red]%})%{$reset_color%}"
}

git_branch() {
    echo $(/usr/bin/env git symbolic-ref HEAD 2>/dev/null | awk -F/ {'print $NF'})
}

git_dirty() {
    st=$(/usr/bin/env git status 2>/dev/null | tail -n 1)
    if [[ $st == "" ]]
    then
        echo ""
    else
        if [[ $st == "nothing to commit, working tree clean" ]]
        then
            echo "on %{$fg_bold[green]%}$(git_prompt_info)%{$reset_color%}"
        else
            echo "on %{$fg_bold[red]%}*$(git_prompt_info)%{$reset_color%}"
        fi
    fi
}

git_unpushed() {
    /usr/bin/env git cherry -v @{upstream} 2>/dev/null
}

git_needs_push() {
    if [[ $git_unpushed == "" ]]
    then
        echo " "
    else
        echo " with %{$fg_bold[magenta]%}git_unpushed%{$reset_color%} "
    fi
}

function git_prompt_info() {
    ref=$(/usr/bin/env git symbolic-ref HEAD 2>/dev/null) || return
    echo "${ref#refs/heads/}"
}

# show rbenv ruby version
rb_prompt() {
    if $(which rbenv &> /dev/null)
    then
        echo "%{$fg_bold[yellow]%}$(rbenv version | awk '{print $1}')%{$reset_color%}"
    else
        echo ""
    fi
}

export PROMPT=$'$(rb_prompt) in $(directory_name) $(git_dirty)$(git_needs_push)$ '
