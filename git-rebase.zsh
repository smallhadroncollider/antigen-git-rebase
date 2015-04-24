rebase() {
    printf "Stash? (y/n): "
    read -r shouldStash

    if [[ "$shouldStash" = "n" ]]; then
        shouldStash=false
    else
        shouldStash=true
        git stash
    fi

    git log --color --graph --pretty=format:'%Cgreen%h%Creset %C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit | cat -n | less

    printf "Commit #: "
    read -r commit

    git rebase -i HEAD~$commit

    if [[ $shouldStash -eq true ]]; then
        git stash pop > /dev/null
    fi
}
