--
-- A Bookmarks Plugin With Global File Store For Neovim Written In Lua.
--
return {
    "tomasky/bookmarks.nvim",
    -- event = "BufReadPre",
    dependencies = {
        'nvim-telescope/telescope.nvim'
    },
    config = function()
        require('bookmarks').setup{
            save_file = vim.fn.expand "./.bookmarks", -- bookmarks save file path

            keywords =  {
                ["@t"] = "☑️ ", -- mark annotation startswith @t ,signs this icon as `Todo`
                ["@w"] = "⚠️ ", -- mark annotation startswith @w ,signs this icon as `Warn`
                ["@f"] = "⛏ ", -- mark annotation startswith @f ,signs this icon as `Fix`
                ["@n"] = " ", -- mark annotation startswith @n ,signs this icon as `Note`
            },

            on_attach = function(bufnr)
                local bm = require "bookmarks"
                local map = vim.keymap.set
                map("n","mm", bm.bookmark_toggle) -- add or remove bookmark at current line
                map("n","ma", bm.bookmark_ann) -- add or edit mark annotation at current line
                map("n","mc", bm.bookmark_clean) -- clean all marks in local buffer
                map("n","mn", bm.bookmark_next) -- jump to next mark in local buffer
                map("n","mp", bm.bookmark_prev) -- jump to previous mark in local buffer
                map("n","ml", bm.bookmark_list) -- show marked file list in quickfix window
                map("n","mx", bm.bookmark_clear_all) -- removes all bookmarks
                map('n', '<leader>fm', [[:Telescope bookmarks list<CR>]])

                vim.api.nvim_create_user_command("BookmarksClearAll", bm.bookmark_clear_all, {})
            end


        }
    end,
}

