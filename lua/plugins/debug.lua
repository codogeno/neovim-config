--
-- nvim-dap is a Debug Adapter Protocol client implementation for Neovim
--


local function keymaps()
    local vim = vim
    local dap = require('dap')

    vim.keymap.set('n', '<F4>', function() dap.run_to_cursor() end)
    vim.keymap.set('n', '<F5>', function() dap.continue() end)
    vim.keymap.set('n', '<F8>', function() dap.step_over() end)
    vim.keymap.set('n', '<F7>', function() dap.step_into() end)
    vim.keymap.set('n', '<F11>', function() dap.step_out() end)
    vim.keymap.set('n', '<Leader>b', function() dap.toggle_breakpoint() end)
    vim.keymap.set('n', '<C-F2>', function() dap.terminate() end)
    vim.keymap.set('n', '<F10>', function() dap.focus_frame() end)

    vim.keymap.set('n', '<Leader>lp', function()
        dap.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))
    end)

    vim.keymap.set('n', '<Leader>dr', function() dap.repl.open() end)

    vim.keymap.set('n', '<Leader>dl', function() dap.run_last() end)

    vim.keymap.set({'n', 'v'}, '<Leader>dh', function()
        require('dap.ui.widgets').hover()
    end)

    vim.keymap.set({'n', 'v'}, '<Leader>dp', function()
        require('dap.ui.widgets').preview()
    end)

    vim.keymap.set('n', '<Leader>df', function()
        local widgets = require('dap.ui.widgets')
        widgets.centered_float(widgets.frames)
    end)

    vim.keymap.set('n', '<Leader>ds', function()
        local widgets = require('dap.ui.widgets')
        widgets.centered_float(widgets.scopes)
    end)
end

return {
    {
        'mfussenegger/nvim-dap',
        dependencies = {
            'ray-x/guihua.lua',
            'rcarriga/nvim-dap-ui',
            'nvim-neotest/nvim-nio',
        },

        config=function()
            local dap = require("dap")

            dap.adapters.gdb = {
                type = "executable",
                command = "/home/dude/bin/yagdb",
                args = {
                    "--interpreter=dap",
                    "--quiet",
                    -- "--eval-command",
                    -- "set print pretty on",
                },
            }

            dap.configurations.cpp = {
              {
                type = 'gdb';
                request = 'launch';
                name = "Launch file";

                program = function()
                    return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
                end;

                -- args = function()
                --     local args_string = vim.fn.input('Arguments: ')
                --     return vim.split(args_string, " +")
                -- end;
              },
              {
                type = 'gdb';
                request = 'launch';
                name = "Launch with args";

                program = function()
                    return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
                end;

                args = function()
                    local args_string = vim.fn.input('Arguments: ')
                    return vim.split(args_string, " +")
                end;
              },
              {
                type = 'gdb';
                request = 'launch';
                name = "Launch with args and environment";

                program = function()
                    return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
                end;

                args = function()
                    local args_string = vim.fn.input('Arguments: ')
                    return vim.split(args_string, " +")
                end;

                env = function()
                    local file_name = vim.fn.input('Env file path: ')
                    require('env_util').get_env_from_file(file_name)
                end;
              },
            }

            keymaps()
        end,
    },

    {
        'rcarriga/nvim-dap-ui',

        requires = {
            "mfussenegger/nvim-dap",
            "nvim-neotest/nvim-nio",
        },


        config = function()
            local dapui = require("dapui")
            dapui.setup()

            local dap = require("dap")

            dap.listeners.before.attach.dapui_config = function() dapui.open() end
            dap.listeners.before.launch.dapui_config = function() dapui.open() end
            dap.listeners.before.event_terminated.dapui_config = function() dapui.close() end
            dap.listeners.before.event_exited.dapui_config = function() dapui.close() end

            vim.keymap.set('n', '<Leader><Space>', function()
                dapui.eval(nil)
            end)
        end,

    },

    {
        'theHamsta/nvim-dap-virtual-text',

        config = function()
            require("nvim-dap-virtual-text").setup()
        end,
    }
}

