#!/bin/zsh

cd $(dirname ${0:A}) # https://unix.stackexchange.com/a/136565

outpath="./images/xn$(date -Is).png"

if [[ $(uname) != 'Darwin' ]]; then
    import "png:$outpath"
    echo "![xn$(date -Is)]($outpath)" | xsel --clipboard --input
else
    screencapture -i "$outpath"
    echo "![xn$(date -Is)]($outpath)" | pbcopy
fi

alacritty --class=float,float -e nvim "$(dirname ${0:A})/Interesting.md"

git add images/ Interesting.md
git commit -m "[CI] [automated] Interesting commit! $(date +%d.%m.%y-%H:%M:%S)"
git pull 2>/dev/null
git push 2>/dev/null
