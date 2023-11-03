-- require('init_packer')

vim.cmd [[packadd! packer.nvim]]

local simple_setup = function(plug_name)
    return string.format('require("%s").setup{}', plug_name)
end

local setup_from = function(path)
    return string.format('require("%s")', path)
end


return require('packer').startup(function(use)
    -- Packer itself
    use 'wbthomason/packer.nvim'

    --
    -- barbar.nvim is a tabline plugin with re-orderable, auto-sizing, clickable tabs, icons, 
    -- nice highlighting, sort-by commands and a magic jump-to-buffer mode. 
    -- Plus the tab names are made unique when two filenames match.
    --
    use {
        'romgrk/barbar.nvim',
        requires = {'kyazdani42/nvim-web-devicons'},
    }

    --
    -- The NERDTree is a file system explorer for the Vim editor
    --
    use {
        'scrooloose/nerdtree'
    }

    --
    -- telescope.nvim is a highly extendable fuzzy finder over lists. Built on the latest awesome features from neovim core.
    -- Telescope is centered around modularity, allowing for easy customization.
    --
    use {
        'nvim-telescope/telescope.nvim',

        requires = {
            {'nvim-lua/plenary.nvim'}
        },
        config = setup_from('plugin_settings/telescope'),
    }

    use 'codogeno/nvim-rg'

    --
    -- This plugin provides a start screen for Vim and Neovim.
    --
    -- It provides dynamically created headers or footers and uses configurable lists to show recently used or bookmarked files
    -- and persistent sessions.
    -- All of this can be accessed in a simple to use menu that even allows to open multiple entries at once.
    --
    -- Startify doesn't get in your way and works out-of-the-box, but provides many options for fine-grained customization.
    --
    use {
        'mhinz/vim-startify',
        config = setup_from('plugin_settings/startify'),
    }

    --
    -- A statusline / bufferline for Neovim written in Lua. 
    -- It is inspired by vim-airline but aims to be as light and simple as possible.
    --
    use {
        'ojroques/nvim-hardline',
        config = setup_from('plugin_settings/hardline')
    }

    --
    -- The goal of nvim-treesitter is both to provide a simple and easy way to use the interface for tree-sitter
    -- in Neovim and to provide some basic functionality such as highlighting based on it
    --
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
    }

    --
    -- This plugin will let you enter command mode (NORMAL) commands using Russian keyboard layout
    --
    use 'powerman/vim-plugin-ruscmd'

    --
    -- An implementation of the Popup API from vim in Neovim. Hope to upstream when complete
    --
    use 'nvim-lua/popup.nvim'

    --
    -- Surround.vim is all about "surroundings": parentheses, brackets, quotes, XML tags, and more.
    -- The plugin provides mappings to easily delete, change and add such surroundings in pairs
    --
    use 'tpope/vim-surround'

    --
    -- f you've ever tried using the . command after a plugin map, you were likely disappointed to discover it only repeated 
    -- the last native command inside that map, rather than the map as a whole. That disappointment ends today.
    -- Repeat.vim remaps . in a way that plugins can tap into it.
    --
    use 'tpope/vim-repeat'

    --
    -- Smart and Powerful commenting plugin for neovim
    --
    use {
        'numToStr/Comment.nvim',
        config = simple_setup('Comment'),
    }

    --
    -- A super powerful autopair plugin for Neovim that supports multiple characters
    --
    use {
        'windwp/nvim-autopairs',
        config = simple_setup('nvim-autopairs'),
    }

    --
    -- ALE (Asynchronous Lint Engine) is a plugin providing linting (syntax checking and semantic errors) in NeoVim 0.6.0+ 
    -- and Vim 8.0+ while you edit your text files, and acts as a Vim Language Server Protocol client.
    --
    use 'dense-analysis/ale'

    --
    -- alternative to default neovim matchparen plugin
    --
    use {
        'monkoose/matchparen.nvim',
        config=simple_setup('matchparen'),
    }

    --
    -- Configs for the Nvim LSP client
    --
    use {
        'neovim/nvim-lspconfig', -- Collection of configurations for the built-in LSP client
        config=setup_from('plugin_settings/lspconfig'),
    }

   -- use 'hrsh7th/nvim-cmp'

    --use 'hrsh7th/cmp-nvim-lsp'

    -- use {
    --     'hrsh7th/nvim-compe',
    --     config=setup_from('plugin_settings/compe'),
    -- }

    --
    -- nvim-dap is a Debug Adapter Protocol client implementation for Neovim
    --
    use 'mfussenegger/nvim-dap'

    use 'rcarriga/nvim-dap-ui'

    use 'theHamsta/nvim-dap-virtual-text'

    --
    -- A simple OOP library for Lua. It has inheritance, metamethods (operators), class variables and weak mixin support.
    --
    use 'anuvyklack/middleclass'

    --
    -- A small Neovim plugin for previewing native LSP's goto definition, type definition,
    -- implementation, and references calls in floating windows.
    --
    use {
        'rmagatti/goto-preview',
        config=function()
            require('goto-preview').setup {
                width = 131;
                height = 35;
                -- debug = true;
                post_open_hook = function(buf, window)
                    vim.cmd [[norm zt]]
                end;
                preview_window_title = { enable = true, position = "center" };
                -- border = {"┏", "━", "┓", "┃", "┛", "━", "┗", "┃"};
                border = "rounded";
            }
        end
    }

    -- use {
    --     'ray-x/go.nvim',
    --     config = simple_setup('go'),
    --     requires = {'mfussenegger/nvim-dap', 'rcarriga/nvim-dap-ui'},
    -- }

    --
    -- A pretty list for showing diagnostics, references, telescope results, quickfix and location lists 
    -- to help you solve all the trouble your code is causing.
    --
    use {
        "folke/trouble.nvim",
        requires = "kyazdani42/nvim-web-devicons",
        config = function()
            require("trouble").setup {
                -- your configuration comes here
                -- or leave it empty to use the default settings
                -- refer to the configuration section below
            }
        end
    }

    --
    -- A better user experience for interacting with and manipulating Vim marks
    --
    use {
        "chentoast/marks.nvim",
        config = function()
            require("marks").setup {
                -- whether to map keybinds or not. default true
                default_mappings = true,
            }
        end
    }

    --
    -- This tiny plugin adds vscode-like pictograms to neovim built-in lsp
    --
    use {
        'onsails/lspkind-nvim',
        config = setup_from('plugin_settings/lspkind'),
    }

    use {
        'hrsh7th/nvim-cmp',
        requires = {
            'L3MON4D3/LuaSnip',
            'saadparwaiz1/cmp_luasnip',
            'hrsh7th/cmp-nvim-lsp',
            'hrsh7th/cmp-path',
            'hrsh7th/cmp-emoji',
            'hrsh7th/cmp-nvim-lsp-signature-help',
            'hrsh7th/cmp-nvim-lua'
        },
        config=setup_from('plugin_settings/cmp'),
	}

    --
    -- NeoWell location lists
    --
    use {
        'nyngwang/NeoWell.lua',
        config = function ()
            require('neo-well').setup {
                height = 10
            }
        end
    }

    -- 
    -- * Automatically expand width of the current window;
    -- * Maximizes and restores the current window.
    --
    use { "anuvyklack/windows.nvim",
       requires = "anuvyklack/middleclass",
       config = function()
          require('windows').setup()
       end
    }

    -- -- TrailBlazer enables you to seemlessly move through important project marks as quickly
    -- -- and efficiently as possible to make your workflow blazingly fast
    -- use({
    --     "LeonHeidelbach/trailblazer.nvim",
    --     config = function()
    --         require("trailblazer").setup({
    --             -- your custom config goes here
    --         })
    --     end,
    -- })

    -- -- use {
    -- --     'ojroques/nvim-buildme',
    -- -- }
    --

    --
    -- Standalone UI for nvim-lsp progress. Eye candy for the impatient.
    --
    use {
        "j-hui/fidget.nvim",
        event = "BufReadPre",
        config = function()
            require("fidget").setup {}
        end,
    }

    --
    -- Go related plugins
    --
    use {
        'ray-x/go.nvim',
        requires = {
            'ray-x/guihua.lua',
            'neovim/nvim-lspconfig',
            'nvim-treesitter/nvim-treesitter',
        },

        config = function()
            require('go').setup{}
        end,
    }

    --
    -- A Lua Gui and util library for nvim plugins
    --
    use 'ray-x/guihua.lua'


    -- use {
    --     'neomake/neomake',
    -- }

    -- use {
    --     'skywind3000/asyncrun.vim',
    --     config = function()
    --         vim.g.asyncrun_bell = 1
    --         vim.g.asyncrun_open = 8
    --     end,
    -- }
end)
