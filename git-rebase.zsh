rebase() {
    stashArg='--no-autostash'

    if ! git diff-index --quiet HEAD; then
        # We only care about stashing if there are unstaged changes
        printf "Stash? (Y/n): "
        read -r shouldStash

        if [[ ! $shouldStash =~ ^[Nn]$ ]]; then
            stashArg='--autostash'
        fi
    fi


    git log --color --graph --pretty=format:'%Cgreen%h%Creset %C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit | cat -n | less

    printf "Commit #: "
    read -r commit

    git rebase -i $stashArg HEAD~$commit
}
