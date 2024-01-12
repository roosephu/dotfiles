alias e = nvim

use ~/.cache/starship/init.nu
use themes/nu-themes/catppuccin-mocha.nu
use custom-completions/git/git-completions.nu *
use modules/virtual_environments/conda.nu
use modules/data_extraction/ultimate_extractor.nu
use aliases/git/git-aliases.nu *

# source ~/.zoxide.nu
# source ~/.local/share/atuin/init.nu

# $env.NU_POWER_SCHEMA = [
#     [
#         {source: pwd,   color: '#353230'}
#         {source: git,   color: '#504945'}
#     ]
#     [
#         {source: proxy, color: 'dark_gray'}
#         {source: host,  color: '#353230'}
#         {source: kube,  color: '#504945'}
#         {source: time,  color: '#666560'}
#     ]
# ]
# use modules/prompt/powerline/power.nu
#     use modules/prompt/powerline/power_git.nu
#     use modules/prompt/powerline/power_kube.nu
# power init

# use modules/prompt/powerline/power.nu
#     use modules/prompt/powerline/power_git.nu
#     power inject 0 1 {source: git,   color: '#504945'}
#     use modules/prompt/powerline/power_kube.nu
#     power inject 1 2 {source: kube,  color: '#504945'} {
#         context: cyan
#     } {
#         reverse: true
#         separator: '@'
#     }
#     use modules/prompt/powerline/power_utils.nu
#     power inject 0 1 {source: atuin, color: '#4C4B4A'}
#     power set time null { style: compact }
# power init

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


