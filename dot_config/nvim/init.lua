local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

vim.opt.wrap = true
vim.opt.expandtab = true
vim.opt.number = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.background = "dark"
vim.opt.clipboard = "unnamedplus"
vim.opt.softtabstop = 8
vim.opt.tabstop = 8
vim.g.mapleader = ' '

vim.api.nvim_create_autocmd({"FileType"}, {
    pattern = "lua",
    callback = function()
        vim.opt_local.tabstop = 4
        vim.opt_local.shiftwidth = 4
    end
})

require('lazy').setup("plugins")
require('nu').setup({use_lsp_features = false})

vim.cmd.colorscheme 'catppuccin-macchiato'
vim.keymap.set({'n', 'x', 'o'}, 'L', 'g_', { noremap = true, silent = true })
vim.keymap.set({'n', 'x', 'o'}, 'H', '_', { noremap = true, silent = true })

-- vim.cmd [[ nmap s <Plug>(easymotion-s2) ]] 
--if vim.g.vscode then
--     vim.keymap.set('x', '<C-/>', VSCodeCommentarygv)
--     -- nmap <C-/> <Plug>VSCodeCommentaryLine
-- end
