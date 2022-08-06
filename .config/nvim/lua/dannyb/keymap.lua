vim.g.mapleader = " "

vim.keymap.set("n", "<Leader>f", ":Telescope find_files<CR>")
vim.keymap.set("n", "<Leader>fh", ":Telescope find_files hidden=true<CR>")
vim.keymap.set("n", "<Leader>g", ":Telescope live_grep<CR>")

vim.keymap.set("n", "<Leader>e", ":Ex<CR>")

