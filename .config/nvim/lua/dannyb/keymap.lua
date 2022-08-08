vim.g.mapleader = " "

vim.keymap.set("n", "<Leader>ff", ":Telescope find_files<CR>")
vim.keymap.set("n", "<Leader>fh", ":Telescope find_files hidden=true<CR>")
vim.keymap.set("n", "<Leader>g", ":Telescope live_grep<CR>")

-- Copying and pasting to clipboard
vim.keymap.set("n", "<Leader>y", "\"+yy")
vim.keymap.set("v", "<Leader>y", "\"+y")
vim.keymap.set("n", "<Leader>p", "\"+p")

vim.keymap.set("n", "<Leader>e", ":Ex<CR>")

