# Directories to search for scripts when calling source or use
$env.NU_LIB_DIRS = [
    ($nu.default-config-dir | path join 'scripts'),
    '/Users/roosephu/git/nu_scripts',
]

# Directories to search for plugin binaries when calling register
$env.NU_PLUGIN_DIRS = [
    ($nu.default-config-dir | path join 'plugins')
]

# To add entries to PATH (on Windows you might use Path), you can use the following pattern:
# let-env PATH = ($env.PATH | split row (char esep) | prepend '/some/path')
$env.PATH = [
    ...($env.PATH | split row (char esep)),
    "/Users/roosephu/opt/anaconda3/bin",
    "/opt/homebrew/bin",
    "/Users/roosephu/.cargo/bin",
]

mkdir ~/.cache/starship
starship init nu | save -f ~/.cache/starship/init.nu
zoxide init nushell | save -f ~/.zoxide.nu
