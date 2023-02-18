require('telescope').setup {
    defaults = {
        cache_picker = {
            num_pickers = 5,
        }
    }
}
require("telescope").load_extension('harpoon')
