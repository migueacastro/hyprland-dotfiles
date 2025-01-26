vim.cmd("set expandtab")
vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.g.mapleader = " "
require("config.lazy")


-- Open tree on startup
vim.keymap.set('n', '<C-q>', ':qa!<CR>', {})
-- Write all with Ctrl + S
vim.keymap.set('n', '<C-s>', ':vsplit<CR>', {})


