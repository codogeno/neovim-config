--
-- A code outline window for skimming and quick navigation
--
return {
    "stevearc/aerial.nvim",

    config = function()
        require("aerial").setup({
            layout = {
                default_direction = "prefer_left"
            };
            nav = {
                preview = true;
            };
        })
    end,
}
