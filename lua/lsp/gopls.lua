local config = vim.lsp.config['gopls'] or {}

if string.find(vim.fn.getcwd(), "arcadia") then
    config.cmd = {
        --"gopls.my",
        "ya", "tool", "gopls",
        "-remote=auto",
        "-logfile=auto",
        --"-logfile=/home/dude/tmp/gopls.log",
        "-debug=:0",
        "-remote.listen.timeout=30s",
        "-remote.debug=:0",
        --"-rpc.trace",
        --"--debug=:6060"
        --"-vv",
    }
end

config.settings = {
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
        arcadiaIndexDirs = {
            "games/backend",
            "games/admin",
        }
    },
}

vim.lsp.config['gopls'] = config
-- return {
--     -- on_attach = on_attach,
--
--     cmd = {
--         "gopls.my",
--         "-remote=auto",
--         "-logfile=auto",
--         --"-logfile=/home/dude/tmp/gopls.log",
--         "-debug=:0",
--         "-remote.listen.timeout=30s",
--         "-remote.debug=:0",
--         --"-rpc.trace",
--         --"--debug=:6060"
--         --"-vv",
--     },
--     root_markers = { "ya.conf", "go.work", "go.mod", ".git"},
--     settings = {
--         gopls = {
--             analyses = { unusedparams = true, unusedwrite = true, shadow = true },
--             hints = {
--                 assignVariableTypes = true,
--                 compositeLiteralFields = true,
--                 compositeLiteralTypes = true,
--                 constantValues = true,
--                 functionTypeParameters = true,
--                 parameterNames = true,
--                 rangeVariableTypes = true,
--             },
--             staticcheck = true,
--             usePlaceholders = true,
--             --directoryFilters = filter,
--             expandWorkspaceToModule = false,
--             arcadiaIndexDirs = {
--                 "games/backend",
--                 "games/admin",
--             }
--         },
--     },
-- }
--
