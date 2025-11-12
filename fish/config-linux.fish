if type -q exa
    alias ll "exa -l -g --icons"
    alias lla "ll -a"
    alias pacman='pacman --color=always'
end

function fish_greeting
    echo Hello friend!
    echo The time is (set_color yellow)(date +%T)(set_color normal) and this machine is called $hostname
end
