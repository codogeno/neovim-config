local old_number = nil
local old_relative_number = nil

local numbering_on = false

local function ToggleNumbering()
    if numbering_on then
        vim.o.number = old_number
        vim.o.relativenumber = old_relative_number
    else
        old_number = vim.o.number
        old_relative_number = vim.o.relativenumber

        vim.o.number = false
        vim.o.relativenumber = false
    end

    numbering_on = not numbering_on
end


vim.api.nvim_create_user_command("ToggleNumbering", ToggleNumbering, {})
vim.api.nvim_create_user_command("ResetDiagnostic", function() vim.diagnostic.reset() end, {})
