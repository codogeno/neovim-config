local config = vim.lsp.config['clangd']

local base_on_attach = config.on_attach

config.on_attach = function(client, bufnr)
    base_on_attach(client, bufnr)

    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<F6>', '<cmd>ClangdSwitchSourceHeader<CR>', {noremap=true, silent=true})
end

vim.lsp.config('clangd', config)

-- return {
--     filetypes = { "c", "cpp", "cc", "c++" },
--     cmd = {
--         'clangd',
--         '--background-index',
--         -- '-j=16',
--         '--clang-tidy',
--         '--header-insertion=never',
--         -- '--log=verbose',
--     },
--     init_options = {
--         usePlaceholders = true,
--         completeUnimported = true,
--         clangdFileStatus = true,
--     },
-- }
