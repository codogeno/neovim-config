--
-- This tiny plugin adds vscode-like pictograms to neovim built-in lsp
--
return {
    'onsails/lspkind-nvim',

    config = function()
        require('lspkind').init({
            mode = 'symbol',
            preset = 'codicons',
            symbol_map = {
                Text = "",
                Method = "",
                Function = "",
                Constructor = "",
                Field = "ﰠ",
                Variable = "",
                Class = "ﴯ",
                Interface = "",
                Module = "",
                Property = "ﰠ",
                Unit = "塞",
                Value = "",
                Enum = "",
                Keyword = "",
                Snippet = "",
                Color = "",
                File = "",
                Reference = "",
                Folder = "",
                EnumMember = "",
                Constant = "",
                Struct = "פּ",
                Event = "",
                Operator = "",
                TypeParameter = ""
            },
        })
    end,
}
