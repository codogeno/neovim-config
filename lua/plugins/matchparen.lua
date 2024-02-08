--
-- alternative to default neovim matchparen plugin
--
return {
    'monkoose/matchparen.nvim',

    config = function()
        require("matchparen").setup{}
    end,
}
