local root_pattern = require('lspconfig').util.root_pattern
local find_git_ancestor = require('lspconfig').util.find_git_ancestor

local on_attach = function(client, bufnr)
    local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
    local opts = { noremap=true, silent=true }

    buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
    buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
    buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
    buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
    buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
    buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
    buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
    buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
    buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
    buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
    buf_set_keymap('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
    buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
    buf_set_keymap('n', '<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
    buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
    buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
    buf_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
    buf_set_keymap('n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
end


require('lspconfig').pylsp.setup{
    on_attach = on_attach,
    -- capabilities = capabilities,
    root_dir = function(fname)
        local root_files = {
            'ya.conf',
        }
        return root_pattern(unpack(root_files))(fname) or find_git_ancestor(fname)
    end,

    settings = {
        pylsp = {
            configurationSources = {"flake8"},
            plugins = {
                jedi_completion = {enabled = true},
                jedi_hover = {enabled = true},
                jedi_references = {enabled = true},
                jedi_signature_help = {enabled = true},
                jedi_symbols = {enabled = true, all_scopes = true},
                pycodestyle = {enabled = false},
                flake8 = {
                    enabled = true,
                    ignore = {},
                    maxLineLength = 90,
                },
                mypy = {enabled = false},
                isort = {enabled = false},
                yapf = {enabled = false},
                pylint = {enabled = false},
                pydocstyle = {enabled = false},
                mccabe = {enabled = false},
                preload = {enabled = false},
                rope_completion = {enabled = false}
            }
        }
    },
}

-- require('lspconfig').pyright.setup{
--     settings = {
--         python = {
--             pythonPath = '/home/dude/games/admin/.venv/bin/python3'
--         }
--     }
-- }

require('lspconfig').gopls.setup{
    on_attach = on_attach,
    root_dir = root_pattern(".go_project"),
}
