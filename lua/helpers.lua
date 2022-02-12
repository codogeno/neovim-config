local M = {}

local default_opts = {noremap = true, silent = true}

local function _map(mode, tbl, opts)
    if opts == nil then
        opts = default_opts
    end
    for key, cmd in pairs(tbl) do
        vim.api.nvim_set_keymap(mode, key, cmd, opts)
    end
end

M.map = function(mapping_table)
    _map('', mapping_table, nil)
end

M.nmap = function(mapping_table )
    _map('n', mapping_table, nil)
end

M.nmap_opts = function(opts, mapping_table)
    _map('n', mapping_table, opts)
end

M.imap = function(mapping_table)
    _map('i', mapping_table, nil)
end


return M
