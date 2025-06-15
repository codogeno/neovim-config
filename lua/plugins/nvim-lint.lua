--
-- An asynchronous linter plugin for Neovim (>= 0.9.5) complementary to the built-in Language Server Protocol support.
--
return {
    'mfussenegger/nvim-lint',

    config = function()
        local lint = require('lint')

        lint.linters_by_ft = {
            python = { 'pylint' },
            cpp = { 'clang-tidy' },
            go = { 'revive '},
        }

        vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost" }, {
            callback = function()
                -- try_lint without arguments runs the linters defined in `linters_by_ft`
                -- for the current filetype
                require("lint").try_lint()
            end,
        })
    end,
}
