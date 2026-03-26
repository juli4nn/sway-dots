if status is-interactive
    # Commands to run in interactive sessions can go here
end

# ./fetch.sh

set fish_greeting

alias neofetch='fastfetch --logo-color-1 blue --logo-color-2 blue --color blue --logo-padding-left 2'
alias fetch='./fetch.sh'
alias ff='fastfetch -c $HOME/.config/fastfetch/nice.jsonc --logo-padding-left 3 --logo-padding-right 4 --logo-padding-top 1'
alias emacs='emacs -nw'
alias doom='~/.emacs.d/bin/doom'
