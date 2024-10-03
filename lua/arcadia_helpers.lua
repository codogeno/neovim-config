local ARCANUM_BASE_PATH = 'https://a.yandex-team.ru/arcadia'

local function get_arcadia_root(fname)
    local root_pattern = require('lspconfig').util.root_pattern

    local root_files = {
        'ya.conf',
    }

    return root_pattern(unpack(root_files))(fname)
end

function PrintArcadiaUrl()
    local fname = vim.api.nvim_buf_get_name(0)
    local lnum = vim.api.nvim_win_get_cursor(0)[1]
    local arc_root = get_arcadia_root(fname)

    if arc_root == nil then
        print('Arcadia  root not found.')

        return
    end

    local start, stop =  string.find(fname, arc_root)
    if start == nil then
        print('Not in arcadia folder.')

        return
    end

    local path_in_arcadia = string.sub(fname, stop + 1)

    print(ARCANUM_BASE_PATH .. path_in_arcadia .. '#L' ..  lnum)
end

vim.api.nvim_create_user_command("ArcadiaURL", PrintArcadiaUrl, {})
