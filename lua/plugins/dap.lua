return {
  'mfussenegger/nvim-dap',
  dependencies = {
    'rcarriga/nvim-dap-ui',
    -- required dependency for dap-ui
    'nvim-neotest/nvim-nio',
    -- install debug adapters
    'jay-babu/mason-nvim-dap.nvim',
    -- my debuggers
    'mfussenegger/nvim-dap-python',
  },
  keys = {
    {
      '<leader>dc',
      function()
        require('dap').continue()
      end,
      desc = '[D]ebug: [C]ontinue',
    },
    {
      '<leader>di',
      function()
        require('dap').step_into()
      end,
      desc = '[D]ebug: Step [I]nto',
    },
    {
      '<leader>do',
      function()
        require('dap').step_out()
      end,
      desc = '[D]ebug: Step [O]ut',
    },
    {
      '<leader>dO',
      function()
        require('dap').step_over()
      end,
      desc = '[D]ebug: Step [O]ver',
    },
    {
      '<leader>db',
      function()
        require('dap').toggle_breakpoint()
      end,
      desc = '[D]ebug: Toggle [B]reakpoint',
    },
    {
      '<leader>dt',
      function()
        require('dapui').toggle()
      end,
      desc = '[D]ebug: Toggle',
    },
  },
  config = function()
    local dap = require 'dap'
    local dapui = require 'dapui'

    require('mason-nvim-dap').setup {
      automatic_installation = true,
      handlers = {},
      ensure_installed = {
        'debugpy',
      },
    }

    dapui.setup {}

    dap.listeners.after.event_initialized['dapui_config'] = dapui.open
    dap.listeners.after.event_terminated['dapui_config'] = dapui.close
    dap.listeners.after.event_exited['dapui_config'] = dapui.close
  end,
}
