--
-- A small Neovim plugin for previewing native LSP's goto definition, type definition,
-- implementation, and references calls in floating windows.
--
return {
    'rmagatti/goto-preview',

    config=function()
        require('goto-preview').setup {
            width = 131;
            height = 35;
            -- debug = true;
            post_open_hook = function(buf, window)
                vim.cmd [[norm zt]]
            end;
            preview_window_title = { enable = true, position = "center" };
            -- border = {"┏", "━", "┓", "┃", "┛", "━", "┗", "┃"};
            border = "rounded";
        }

        local _ = vim.keymap.set

        _('n', 'gdp', function() require('goto-preview').goto_preview_definition() end)
        _('n', 'gtp', function() require('goto-preview').goto_preview_type_definition() end)
        _('n', 'gip', function() require('goto-preview').goto_preview_implementation() end)
        _('n', 'grp', function() require('goto-preview').goto_preview_references() end)
        _('n', '<leader>ft', function() require('goto-preview').goto_preview_type_definition() end)
    end,
}
