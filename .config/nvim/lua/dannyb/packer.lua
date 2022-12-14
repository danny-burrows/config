
-- Bootstrap Packer
local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
  vim.cmd [[packadd packer.nvim]]
end

return require('packer').startup(function(use)

    use { 'wbthomason/packer.nvim' }
    use { 'ellisonleao/gruvbox.nvim' }

    -- Configs for Nvim LSP
    use 'neovim/nvim-lspconfig'

    use 'simrat39/rust-tools.nvim'

    -- Telescope search and grepping.
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.0',
        requires = { {'nvim-lua/plenary.nvim'} }
    }
    use { 'nvim-treesitter/nvim-treesitter' }

    use {
        'lewis6991/gitsigns.nvim', tag = 'v0.5',
       config = function()
            require('gitsigns').setup {
                signcolumn = false,
                numhl = true,
                current_line_blame = true,
            }
        end
    }

    -- Bufferline (Tabs)
    use {'akinsho/bufferline.nvim', tag = "v2.*"}

    -- Nvim Tree
    use { 'kyazdani42/nvim-tree.lua', tag = 'nightly' }

    -- Multiple cursors
    use { 'mg979/vim-visual-multi' }

    if packer_bootstrap then
        require('packer').sync()
    end

end)

