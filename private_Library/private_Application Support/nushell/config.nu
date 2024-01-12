alias e = nvim

use ~/.cache/starship/init.nu
use themes/nu-themes/catppuccin-mocha.nu
use custom-completions/git/git-completions.nu *
use modules/virtual_environments/conda.nu
use modules/data_extraction/ultimate_extractor.nu
use aliases/git/git-aliases.nu *

# source ~/.zoxide.nu
# source ~/.local/share/atuin/init.nu

$env.CONDA_NO_PROMPT = true
# $env.LS_COLORS = (vivid generate catppuccin-macchiato | str trim)
$env.EDITOR = nvim

let config = {
    show_banner: false
    color_config: (catppuccin-mocha)
    shell_integration: true
    filesize: { metric: true }
    float_precision: 3
    highlight_resolved_externals: false
    keybindings: [
        {
            name: fuzzy_history
            modifier: control
            keycode: char_r
            mode: emacs
            event: {
                send: executehostcommand
                cmd: "commandline (history | each { |it| $it.command } | uniq | reverse | str join (char nl) | fzf --layout=reverse --height=40% -q (commandline) | decode utf-8 | str trim)"
            }
        }
    ]
    menus: [
        {
            name: completion_menu
            only_buffer_difference: false
            marker: ""
            type: {
                layout: columnar
                columns: 4
                col_width: 20     # Optional value. If missing all the screen width is used to calculate column width
                col_padding: 2
            }
            style: {
                text: white
                selected_text: white_reverse
                description_text: yellow
            }
        }
    ]
    cursor_shape: { emacs: block }
}
$env.config = ($env.config | merge $config)


