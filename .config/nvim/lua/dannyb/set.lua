vim.opt.guicursor = ""

vim.opt.cursorline = true

-- Line numbers
vim.opt.nu = true
-- vim.opt.relativenumber = true

-- Dealing with tabs
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

-- Gruvbox theme settings
vim.opt.background = "dark"
vim.cmd([[colorscheme gruvbox]])

-- Bufferline
vim.opt.termguicolors = true
require("bufferline").setup {
    options = {
        buffer_close_icon = 'X',
        close_icon = 'X',
    }
}

-- Nvim tree
require("nvim-tree").setup {
    renderer = { 
        icons = { 
            show = { 
	            file = false,
	            folder = false,
                folder_arrow = false
            }
        }
    }
}

