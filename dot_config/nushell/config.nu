const NU_LIB_DIRS = [
    '/home/yuping/src/nu_scripts',
]

const NU_PLUGIN_DIRS = [
]

$env.PATH ++= [
    "/home/yuping/.local/bin",
    "/home/yuping/anaconda3/bin",
    "/home/yuping/.bin",
]

let autoload_dir = "~/.local/share/nushell/vendor/autoload" | path expand
mkdir $autoload_dir
starship init nu                   | save -f ($autoload_dir | path join starship.nu)
# zoxide init nushell                | save -f ($autoload_dir | path join zoxide.nu)
atuin init nu --disable-up-arrow   | save -f ($autoload_dir | path join atuin.nu)
jj util completion nushell         | save -f ($autoload_dir | path join jj.nu)


alias e = nvim
alias c = bat -pp
alias l = ls -s

source themes/nu-themes/gruvbox-dark.nu
use custom-completions/git/git-completions.nu *
use modules/virtual_environments/conda.nu
use modules/data_extraction/ultimate_extractor.nu

$env.CONDA_NO_PROMPT = true
$env.EDITOR = "nvim"
$env.config.buffer_editor = "nvim"

$env.config.show_banner = false
$env.config.filesize = {
    unit: metric
    precision: 1
}
$env.config.float_precision = 3
$env.config.highlight_resolved_externals = false
$env.config.menus ++= [
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
$env.config.cursor_shape.emacs = "line"
$env.config.table.mode = "light"
$env.config.history = {
    file_format: sqlite
    max_size: 1_000_000
    sync_on_enter: true
    isolation: true
}

# local changes

alias sq = squeue
alias sc = scancel
alias sqm = sq --me
alias sqv = sq --partition voyage
alias gs = gcloud storage

$env.SQUEUE_FORMAT2 = "JobID:7,Partition:10,StateCompact:3,Name:100,UserName:12,TimeUsed:15,tres-per-node:16,ReasonList:25,cpus-per-task:4"
$env.SQUEUE_SORT = "-S"
