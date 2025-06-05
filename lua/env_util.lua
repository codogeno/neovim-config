M = {}

local function strip_quotes(s)
    if string.match(s, [[^%'.*%'$]]) or string.match(s, [[^%".*%"$]]) then
        return string.sub(s, 2, string.len(s)-1)
    end

    return s
end

local function get_env_from_file(env_file_name)
    local file, err = io.open(env_file_name, "r")

    if not file then
        error("Could not open file: " .. err)
    end

    local result = {}

    local i = 0
    for line in file:lines() do
        i = i + 1
        -- vim.print(i, line)
        local fs = vim.split(line, "=", {trimempty=true})

        if table.maxn(fs) ~= 2 then
            error('Invalid entry in environment file: "' .. line .. '" (' .. env_file_name .. ':' .. i .. ')' )
        end

        local key, value = unpack(fs)
        table.insert(result,
            {
                [key] = strip_quotes(value)
            }
        )
    end

    file:close()

    return result
end

M.get_env_from_file = get_env_from_file

return M
