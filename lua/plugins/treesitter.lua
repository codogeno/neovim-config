--
-- The goal of nvim-treesitter is both to provide a simple and easy way to use the interface for tree-sitter
-- in Neovim and to provide some basic functionality such as highlighting based on it
--
return {
    'nvim-treesitter/nvim-treesitter',

    event = { "BufReadPre", "BufNewFile" },

    build = ":TSUpdate",

    dependencies = {
      "nvim-treesitter/nvim-treesitter-textobjects",
      "windwp/nvim-ts-autotag",
    },

    config = function()
        local treesitter_config = require("nvim-treesitter.configs")

        treesitter_config.setup{
            -- ensure_installed = require("utils").parsers,
            ensure_installed = {
                "bash",
                "css",
                "dockerfile",
                "gitignore",
                "json",
                "javascript",
                "typescript",
                "html",
                "markdown",
                "markdown_inline",
                "python",
                "go",
                "lua",
                "vim",
                "yaml",
            },
            sync_install = false,

            highlight = {
                enable = true,
            },

            indent = {
                enable = true,
                disable = {
                    "python",
                    "css"
                }
            },

            -- Integration with other plugins
            autopairs = { -- require autopairs plugin
                enable = true,
            },

            autotag = { -- require autotag plugin
                enable = true,
            },

            context_commentstring = { -- require ts-comment string plugin
                enable = true,
                enable_autocmd = false,
            },
        }
    end,
}
