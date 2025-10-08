local config = vim.lsp.config['pyright']

config.settings.python.analysis.typeCheckingMode = 'strict'

vim.lsp.config('pyright', config)
