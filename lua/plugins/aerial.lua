--
-- A code outline window for skimming and quick navigation
--
return {
    "stevearc/aerial.nvim",

    config = function()
        local aerial = require("aerial")
        aerial.setup{
            layout = {
                default_direction = "prefer_left"
            };
            nav = {
                preview = true;
            };
        }

        local _ = vim.keymap.set

        _("n", "<A-m>", "<cmd>AerialToggle!<CR>")
        _("n", "<A-n>", "<cmd>AerialNavOpen<CR>")
    end,
}
