#!/bin/zsh

cd $(dirname ${0:A}) # https://unix.stackexchange.com/a/136565

outpath="./images/xn$(date -Is).png"
pastestr="[![xn$(date -Is)]($outpath)](https://github.com/Jemoka/interesting/blob/master/public/$(echo $outpath | cut -c3-)?raw=true)"

if [[ $(uname) != 'Darwin' ]]; then
    import "png:$outpath"
    echo "$pastestr" | xsel --clipboard --input
else
    screencapture -i "$outpath"
    echo "$pastestr" | pbcopy
fi

alacritty --class=float,float -e nvim "$(dirname ${0:A})/Interesting.md"

git add images/ Interesting.md
git commit -m "[CI] [automated] Interesting commit! $(date +%d.%m.%y-%H:%M:%S)"
git pull 2>/dev/null
git push 2>/dev/null
