--
-- ALE (Asynchronous Lint Engine) is a plugin providing linting (syntax checking and semantic errors) in NeoVim 0.6.0+ 
-- and Vim 8.0+ while you edit your text files, and acts as a Vim Language Server Protocol client.
--
return {
    'dense-analysis/ale',
    config = function()
        local g = vim.g

        g.ale_echo_msg_format = '[%linter%] %s [%severity%]'
        g.ale_python_flake8_options = '--max-line-length 130'
        g.ale_lint_on_enter = 0
        g.ale_lint_on_text_changed = 'never'
        g.ale_lint_on_insert_leave = 0
        g.ale_use_neovim_diagnostics_api = 1
        g.ale_linters = {
           cpp = {'clangs', 'clangtidy'},
           proto = {},
           go = {'gofmt', 'govet', 'revive'}
        }
    end,
}
