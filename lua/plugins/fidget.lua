--
-- Standalone UI for nvim-lsp progress. Eye candy for the impatient.
--
return {
    "j-hui/fidget.nvim",
    event = "BufReadPre",
    config = function()
        require("fidget").setup{}
    end,
}
