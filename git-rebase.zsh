rebase() {
    printf "Stash? (Y/n): "
    read -r shouldStash

    if [[ ! $shouldStash =~ ^[Nn]$ ]]; then
        stashArg='--autostash'
    else
        stashArg='--no-autostash'
    fi

    git log --color --graph --pretty=format:'%Cgreen%h%Creset %C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit | cat -n | less

    printf "Commit #: "
    read -r commit

    git rebase -i $stashArg HEAD~$commit
}
