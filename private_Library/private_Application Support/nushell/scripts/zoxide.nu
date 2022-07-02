# =============================================================================
#
# Hook configuration for zoxide.
#

# Hook to add new entries to the database.
export def __zoxide_hook [] {
    shells | where active == true | each { |it| if (do -i {$it | get path | path exists} | length) != 0 { $it }} | get path | each { |it|
        zoxide add -- $it
    }
}

# =============================================================================
#
# When using zoxide with --no-aliases, alias these internal functions as
# desired.
#

# Jump to a directory using only keywords.
export def-env z [...rest:string] {
    let arg0 = ($rest | append '~' | first 1);
    cd (if ($rest | length) <= 1 && ($arg0 == '-' || ($arg0 | path expand | path exists)) {
       $arg0
    } else {
       let result = $'(zoxide query --exclude (pwd) -- $rest | str trim -r -c (char newline))'
       $result
    })
}

# Jump to a directory using interactive search.
export def-env zi  [...rest:string] {
    cd (zoxide query -i -- $rest | str trim -r -c (char newline))
}
