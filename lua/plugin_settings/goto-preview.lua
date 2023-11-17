require('goto-preview').setup {
    width = 140;
    height = 24;
    --debug = true;
    post_open_hook = function(buf, window)
        vim.cmd [[norm zt]]
    end;
    preview_window_title = { enable = true, position = "center" },
    border = {"┏", "━" ,"┓", "┃", "┛", "━"", "┗", "┃"}
}
