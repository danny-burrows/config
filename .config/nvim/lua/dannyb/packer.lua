
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

    -- Telescope search and grepping.
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.0',
        requires = { {'nvim-lua/plenary.nvim'} }
    }
    use { 'nvim-treesitter/nvim-treesitter' }

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

    if packer_bootstrap then
        require('packer').sync()
    end

end)

