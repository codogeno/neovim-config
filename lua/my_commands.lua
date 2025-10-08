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

---
-- Выделяет текст под курсором, который соответствует заданному регулярному выражению.
-- @param pattern (string) Vim-совместимое регулярное выражение.
--
local function select_by_regex(pattern)
    -- 1. Получаем необходимую информацию о текущем состоянии
    local current_win = 0 -- 0 означает текущее окно
    local current_buf = vim.api.nvim_get_current_buf()
    local cursor_pos = vim.api.nvim_win_get_cursor(current_win)
    local line_num = cursor_pos[1] -- номер строки (1-based)
    local cursor_col = cursor_pos[2] -- номер колонки (0-based, в байтах)
    local line_text = vim.api.nvim_buf_get_lines(current_buf, line_num - 1, line_num, false)[1]

    if not line_text or line_text == '' then
        return
    end

    -- 2. Ищем все совпадения на строке, чтобы найти то, которое под курсором
    local match_start_col, match_end_col
    local search_offset = 0 -- смещение для поиска (в байтах)

    local matched_text = nil
    while search_offset < #line_text do
        local text, start_idx, end_idx = unpack(vim.fn.matchstrpos(line_text, pattern, search_offset))

        if start_idx == -1 then
            break -- Больше совпадений на строке не найдено
        end

        -- 3. Проверяем, находится ли курсор внутри найденного совпадения
        -- end_idx - это индекс последнего байта, поэтому проверка <=
        if cursor_col >= start_idx and cursor_col <= end_idx then
            matched_text = text

            break
        end

        search_offset = end_idx + 1
    end

    if matched_text then
        matched_text = vim.fn.escape(matched_text, ".*^$/\\~[]")

        vim.fn.setreg('/', matched_text)
        vim.cmd('set hlsearch')
    end
end

local WORD_WITH_HYPHEN = [[\c\K[a-z\-0-9]\+]]  -- i.e 'abcd-efgh-1234'

vim.api.nvim_create_user_command("ToggleNumbering", ToggleNumbering, {})
vim.api.nvim_create_user_command("ResetDiagnostic", function() vim.diagnostic.reset() end, {})

vim.keymap.set('n', '<leader>*', function()
    select_by_regex(WORD_WITH_HYPHEN)
end)
