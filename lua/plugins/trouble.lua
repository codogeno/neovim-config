--
-- A pretty list for showing diagnostics, references, telescope results, quickfix and location lists 
-- to help you solve all the trouble your code is causing.
--
return {
    "folke/trouble.nvim",

    dependencies = {
        "kyazdani42/nvim-web-devicons",
    },

    config = function()
        local trouble = require("trouble")
        trouble.setup {
            -- your configuration comes here
            -- or leave it empty to use the default settings
            -- refer to the configuration section below
            width=40,
        }

        vim.keymap.set("n", "<A-t>", '<cmd>Trouble diagnostics toggle<cr>', {desc="Toggle trouble's window"})
    end
}
