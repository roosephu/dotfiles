use epm


# epm:install github.com/muesli/elvish-libs
# use github.com/muesli/elvish-libs/theme/powerline
set paths = [
    /opt/homebrew/opt/coreutils/libexec/gnubin
    /opt/homebrew/bin
    /Library/TeX/texbin
    /opt/pdflabs/pdftk/bin
    /usr/local/bin
    ~/.cargo/bin
    $@paths
]

set E:C_INCLUDE_PATH = $E:C_INCLUDE_PATH":/opt/homebrew/include/"
# iterm2 integration
epm:install &silent-if-installed github.com/zzamboni/elvish-modules
use github.com/zzamboni/elvish-modules/iterm2
iterm2:init

# starship
eval (starship init elvish)
# eval (zoxide init elvish | slurp)
set edit:rprompt-persistent = $false

epm:install &silent-if-installed github.com/zzamboni/elvish-completions
use github.com/zzamboni/elvish-completions/builtins
use github.com/zzamboni/elvish-completions/git



# aliasing
use github.com/zzamboni/elvish-modules/alias
alias:new ls exa
alias:new l exa -al
alias:new md mkdir -p
alias:new e nvim
alias:new ga git add 
alias:new gc git commit
alias:new gp git push
alias:new gl git pull
alias:new gst git status
alias:new grmc git rm --cached
alias:new grhh git reset HEAD --hard
alias:new glola git log --graph --pretty='%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ar) %C(bold blue)<%an>%Creset' --all

# auto update
epm:install &silent-if-installed github.com/iwoloschin/elvish-packages
use github.com/iwoloschin/elvish-packages/update
fn download-elvish-head {
    if (update:async-check-commit) {
        cd /tmp
        curl -OL https://dl.elv.sh/darwin-amd64/elvish-HEAD.tar.gz
        tar xvf elvish-HEAD.tar.gz
        sudo cp elvish-HEAD (which elvish)
    }
}

# key bindings
use readline-binding
set edit:insert:binding[Alt-d] = { edit:kill-word-right }
set edit:insert:binding[Ctrl-n] = { edit:navigation:start }
set edit:insert:binding[Ctrl-l] = { edit:location:start }

# completion mode
var completion-status = idle
for key [Tab Shift-Tab Up Down Left Right Ctrl-N Ctrl-P Ctrl-B Ctrl-F] {
    var navigate-fn = $edit:completion:binding[$key]
    set edit:completion:binding[$key] = { 
        $navigate-fn 
        set completion-status = navigate
    }
}
set edit:insert:binding[Tab] = {
    edit:completion:smart-start
    set completion-status = filter
}

var alphabet = [] # [a b c d e f g h i j k l m n o p q r s t u v w x y z 0 1 2 3 4 5 6 7 8 9]
for key $alphabet {
    if (has-key $edit:completion:binding $key) {
        # set old-fn = $edit:completion:binding[$key]
        assert 0
    }
    var k = $key  # to generate a closure
    set edit:completion:binding[$key] = { 
        if (eq $completion-status navigate) {
            edit:completion:accept
            edit:close-mode
            set completion-status = idle
        } else {
            set completion-status = filter
        }
        edit:insert-at-dot $k
    }
}
