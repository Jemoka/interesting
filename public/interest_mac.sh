#!/usr/bin/zsh

# use this script to log an interest if you
# have the pasteimage script + want to use my thing

interesting () {
    pushd ~/Documents/Projects/interesting/public/
    git pull 2>/dev/null
    imageurl=$(cat /dev/urandom | base64 | tr -dc '0-9a-zA-Z' | head -c30)
    pushd ./images
    pasteimage "./$imageurl.png"
    popd
    echo "![Pasted image $(date +%d.%m.%y-%H:%M:%S)](./images/$imageurl.png)" | pbcopy
    nvim ./Interesting.md
    git add -A
    git commit -m "[CI] [automated] Interesting commit! $(date +%d.%m.%y-%H:%M:%S)"
    git pull 2>/dev/null
    git push 2>/dev/null
    popd
}

alias i="interesting"


