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
                Method = "м",
                Function = "⨍",
                Constructor = "к",
                Field = "◊",
                Variable = "",
                Class = "ℂ",
                Interface = "🝢",
                Module = "",
                Property = "ℙ",
                Unit = "塞",
                Value = "",
                Enum = "🞗",
                Keyword = "",
                Snippet = "",
                Color = "",
                File = "",
                Reference = "",
                Folder = "",
                EnumMember = "",
                Constant = "",
                Struct = "🗉",
                Event = "",
                Operator = "",
                TypeParameter = ""
            },
        })
    end,
}
