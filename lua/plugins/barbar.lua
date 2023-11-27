return {
    --
    -- barbar.nvim is a tabline plugin with re-orderable, auto-sizing, clickable tabs, icons, 
    -- nice highlighting, sort-by commands and a magic jump-to-buffer mode. 
    -- Plus the tab names are made unique when two filenames match.
    --
    'romgrk/barbar.nvim',
    dependencies = {
        'kyazdani42/nvim-web-devicons'
    },

    config = function()
        b = require('barbar')

        b.setup{
            -- Enable/disable animations
            animation = true,

            -- Enable/disable auto-hiding the tab bar when there is a single buffer
            auto_hide = false,

            -- Enable/disable current/total tabpages indicator (top right corner)
            tabpages = true,

            -- Enable/disable close button
            closable = true,

            -- Enables/disable clickable tabs
            --  - left-click: go to buffer
            --  - middle-click: delete buffer
            clickable = true,

            -- Excludes buffers from the tabline
            exclude_ft = {'javascript'},
            exclude_name = {'package.json'},

            -- Enable/disable icons
            -- if set to 'numbers', will show buffer index in the tabline
            -- if set to 'both', will show buffer index and icons in the tabline
            icons = { 
                buffer_index = true, 
                filetype = { enabled = false },
                pinned = { button = '車'},
                separator = { left = '▎' },
                inactive = {
                    separator = { left = '▎', }
                },
                button = '',
                modified = { buttonb = '*'},
            },

            -- If set, the icon color will follow its corresponding buffer
            -- highlight group. By default, the Buffer*Icon group is linked to the
            -- Buffer* group (see Highlighting below). Otherwise, it will take its
            -- default value as defined by devicons.
            icon_custom_colors = false,

            -- Configure icons on the bufferline.
            -- icon_separator_active = '|',
            -- icon_close_tab_modified = '●';

            -- If true, new buffers will be inserted at the start/end of the list.
            -- Default is to insert after current buffer.
            insert_at_end = false,
            insert_at_start = false,

            -- Sets the maximum padding width with which to surround each tab
            maximum_padding = 1,

            -- Sets the maximum buffer name length.
            maximum_length = 30,

            -- If set, the letters for each buffer in buffer-pick mode will be
            -- assigned based on their name. Otherwise or in case all letters are
            -- already assigned, the behavior is to assign letters in order of
            -- usability (see order below)
            semantic_letters = true,

            -- New buffer letters are assigned in this order. This order is
            -- optimal for the qwerty keyboard layout but might need adjustement
            -- for other layouts.
            letters = 'asdfjkl;ghnmxcvbziowerutyqpASDFJKLGHNMXCVBZIOWERUTYQP',
            -- letters = '1234567890',

            -- Sets the name of unnamed buffers. By default format is "[Buffer X]"
            -- where X is the buffer number. But only a static string is accepted here.
            no_name_title = nil,
        }

        -- keymapping
        local _ = vim.keymap.set

        _('n', '<A-,>', ':BufferPrevious<CR>')
        _('n', '<A-.>', ':BufferNext<CR>')
        _('n', '<C-A-0>', ':BufferMoveStart<CR>')

        -- Re-order to previous/next
        _('n', '<A-<>', ':BufferMovePrevious<CR>')
        _('n', '<A->>', ':BufferMoveNext<CR>')

        -- Goto buffer in position...
        _('n', '<A-1>', ':BufferGoto 1<CR>')
        _('n', '<A-2>', ':BufferGoto 2<CR>')
        _('n', '<A-3>', ':BufferGoto 3<CR>')
        _('n', '<A-4>', ':BufferGoto 4<CR>')
        _('n', '<A-5>', ':BufferGoto 5<CR>')
        _('n', '<A-6>', ':BufferGoto 6<CR>')
        _('n', '<A-7>', ':BufferGoto 7<CR>')
        _('n', '<A-8>', ':BufferGoto 8<CR>')
        _('n', '<A-9>', ':BufferGoto 9<CR>')
        _('n', '<A-0>', ':BufferGoto 10<CR>')
        _('n', '<A-->', ':BufferLast<CR>')

        -- Close buffer
        _('n', '<A-c>', ':BufferClose<CR>')
        _('n', '<S-A-c>', ':BufferCloseAllButPinned<CR>')

        -- Magic buffer-picking mode
        _('n', '<C-p>', ':BufferPick<CR>')
    end,
}
