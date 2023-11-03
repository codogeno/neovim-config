local root_pattern = require('lspconfig').util.root_pattern
local find_git_ancestor = require('lspconfig').util.find_git_ancestor

local on_attach = function(client, bufnr)
    local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
    local opts = { noremap=true, silent=true }

    buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
    buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
    buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
    --buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
    buf_set_keymap('n', 'gi', '<cmd>lua require("telescope.builtin").lsp_implementations({sorting_strategy="ascending"})<CR>', opts)
    buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
    buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
    buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
    buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
    buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
    buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
    buf_set_keymap('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
    --buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
    buf_set_keymap('n', 'gr', [[<cmd>lua require('telescope.builtin').lsp_references({sorting_strategy="ascending"})<CR>]], opts)
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

    host_python = "/home/dude/games/admin/venv/bin/python3",

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
                    maxLineLength = 120,
                },
                mypy = {enabled = false},
                isort = {enabled = false},
                yapf = {enabled = false},
                pylint = {enabled = false},
                pydocstyle = {enabled = false},
                mccabe = {enabled = false},
                preload = {enabled = false},
                rope_completion = {enabled = true}
            }
        }
    },
}

local util = require "lspconfig.util"
local filter = {
  -- "-/home/dude/games/go/arcadia/",
  -- "+/home/dude/games/go/arcadia/games/backend",
    "-",
    '-vendor',
    '+vendor/github.com/ydb-platform/ydb-go-sdk/v3',
    '+vendor/github.com/labstack/echo/v4',
    '+vendor/github.com/stretchr/testify',
    "+library/go",
    "-library/python",
    "-library/cpp",
    "-contrib",
    "+contrib/go",
    "-sandbox",
    "-logfeller",
    "-kikimr/public/sdk/python",
    "-ydb/public/sdk/python",
    "+games/backend",
}

-- print("NAME: ", vim.api.nvim_buf_get_name(0))
if string.find(vim.api.nvim_buf_get_name(0), "/arcadia") == nil then
    filter = {}
    --print("EMPTY FILTER")
end

require('lspconfig').gopls.setup{
    on_attach = on_attach,

    cmd = {
        --"gopls",
        "gopls.my",
        "-remote=auto",
        "-logfile=auto",
        --"-logfile=/home/dude/tmp/gopls.log",
        "-debug=:0",
        "-remote.listen.timeout=30s",
        "-remote.debug=:0",
        --"-rpc.trace",
        --"--debug=:6060"
        --"-vv",
    },
    --root_dir = root_pattern(".arcadia.root", ".git"),
    --root_dir = root_pattern(".go_project", ".git"),
    root_dir = root_pattern("ya.make", "go.work", "go.mod", ".git"),
    settings = {
        gopls = {
            analyses = { unusedparams = true, unusedwrite = true, shadow = true },
            hints = {
                assignVariableTypes = true,
                compositeLiteralFields = true,
                compositeLiteralTypes = true,
                constantValues = true,
                functionTypeParameters = true,
                parameterNames = true,
                rangeVariableTypes = true,
            },
            staticcheck = true,
            usePlaceholders = true,
            --directoryFilters = filter,
            expandWorkspaceToModule = false,
        },
    },
}
