--
-- telescope.nvim is a highly extendable fuzzy finder over lists. Built on the latest awesome features from neovim core.
-- Telescope is centered around modularity, allowing for easy customization.
--
return {
    'nvim-telescope/telescope.nvim',

    dependencies = {
        'nvim-lua/plenary.nvim'
    },

    config = function()
        local telescope = require("telescope")

        telescope.setup{
            defaults = {
                cache_picker = {
                    num_pickers = 5,
                };
                sorting_strategy = "ascending",
                scroll_strategy = "limit",
                -- mappings = {
                --     n = {
                --         ["A-Up"] = "preview_scrolling_up":;
                --         ["A-Down"] = require('telescope.actions').preview_scrolling_down(0);
                --     }
                -- }
            }
        }

        local _ = vim.keymap.set
        local builtin = require('telescope.builtin')

        _('n', '<leader>ff', function() builtin.find_files({sorting_strategy="ascending"}) end)
        _('n', '<leader>ffc', function() builtin.find_files({search_file=vim.call('expand','<cword>'); sorting_strategy="ascending"}) end)
        _('n', '<leader>fg', function() builtin.live_grep({sorting_strategy="ascending"}) end)
        _('n', '<leader>fw', function() builtin.grep_string({word_match='-w';sorting_strategy="ascending"}) end)
        _('n', '<leader>fwp', function() builtin.grep_string({word_match='-w';sorting_strategy="ascending";additional_args={"-t";"protobuf"}}) end)
        -- _('n', '<leader>fwc', function() builtin.grep_string({word_match='-w';grep_open_files=true;sorting_strategy="ascending"}) end)
        _('n', '<leader>fwc', function() builtin.grep_string({word_match='-w';search_dirs={vim.fn.expand("%:p")};sorting_strategy="ascending"}) end)
        _('n', '<leader>fi', function() builtin.lsp_implementations({sorting_strategy="ascending"}) end)
        _('n', '<leader>fl', function() builtin.resume() end)
        _('n', '<leader>flh', [[:Telescope pickers<CR>]])
        _('n', '<leader>fr', function() builtin.lsp_references({sorting_strategy="ascending", jump_type="vsplit"}) end)
        _('n', '<leader>fb', function() builtin.buffers() end)
        _('n', '<leader>gd', function() builtin.lsp_() end)
        --_('n', '<leader>fm', [[:Telescope harpoon marks<CR>]])
        --_('n', '<leader>fm', [[:Telescope marks<CR>]])

        -- Search for current buffer only
        _('n', '<leader>fgc', function() builtin.live_grep({search_dirs={vim.fn.expand("%:p")}, sorting_strategy="ascending"}) end)
    end,
}

