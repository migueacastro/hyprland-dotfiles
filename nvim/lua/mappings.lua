require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")
map('t', '<C-w>h', "<C-\\><C-n><C-w>h",{silent = true})
-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
