
return require("packer").startup(function(use)

    use { "wbthomason/packer.nvim" }
    use { "ellisonleao/gruvbox.nvim" }

    -- Telescope search and grepping.
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.0',
        requires = { {'nvim-lua/plenary.nvim'} }
    }

    use {
        'lewis6991/gitsigns.nvim', tag = 'release',
       config = function()
            require('gitsigns').setup {
                signcolumn = false,
                numhl = true,

                current_line_blame = true,
            }
        end
    }

end)

