-- require('init_packer')

vim.cmd [[packadd! packer.nvim]]

local simple_setup = function(plug_name)
    return string.format('require("%s").setup{}', plug_name)
end

local setup_from = function(path)
    return string.format('require("%s")', path)
end


return require('packer').startup(function()
    -- Packer сам себя
    use 'wbthomason/packer.nvim'

    use {
        'romgrk/barbar.nvim',
        requires = {'kyazdani42/nvim-web-devicons'},
    }

    use {
        'scrooloose/nerdtree'
    }
    --use {
    --    'kyazdani42/nvim-tree.lua', requires = 'kyazdani42/nvim-web-devicons',
    --    config = function() require'nvim-tree'.setup {} end,
    --}

    use {
        'nvim-telescope/telescope.nvim',

        requires = {
            {'nvim-lua/plenary.nvim'}
        },
        config = simple_setup('telescope'),
    }

    use 'codogeno/nvim-rg'

    use {
        'mhinz/vim-startify',
        config = setup_from('plugin_settings/startify'),
    }

    -- use {
    --     'nvim-lualine/lualine.nvim',
    --     requires = {'kyazdani42/nvim-web-devicons', opt = true},
    --     config = function() require('lualine').setup{
    --         options = {
    --             theme = 'horizon',
    --         },
    --
    --         sections = {
    --             theme = 'horizon',
    --             lualine_c = {
    --                 {
    --                     'filename',
    --                     file_status = true,   -- displays file status (readonly status, modified status)
    --                     path = 1,             -- 0 = just filename, 1 = relative path, 2 = absolute path
    --                     shorting_target = 50, -- Shortens path to leave 40 space in the window
    --                 }
    --             }
    --         }
    --     } end,
    -- }
    use {
        'ojroques/nvim-hardline',
        config = setup_from('plugin_settings/hardline')
    }

    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
    }

    use 'powerman/vim-plugin-ruscmd'

    use 'nvim-lua/popup.nvim'

    use 'tpope/vim-surround'

    use 'tpope/vim-repeat'

    use {
        'numToStr/Comment.nvim',
        config = simple_setup('Comment'),
    }

    use {
        'windwp/nvim-autopairs',
        config = simple_setup('nvim-autopairs'),
    }

    use 'dense-analysis/ale'

    use {
        'monkoose/matchparen.nvim',
        config=simple_setup('matchparen'),
    }

    use {
        'neovim/nvim-lspconfig', -- Collection of configurations for the built-in LSP client
        config=setup_from('plugin_settings/lspconfig'),
    }

   -- use 'hrsh7th/nvim-cmp'

    --use 'hrsh7th/cmp-nvim-lsp'

    use {
        'hrsh7th/nvim-compe',
        config=setup_from('plugin_settings/compe'),
    }
end)
