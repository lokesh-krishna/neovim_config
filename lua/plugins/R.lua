return {
  'R-nvim/R.nvim',
  dependencies = {
    {
      'R-nvim/cmp-r',
      config = function()
        require('cmp_r').setup {
          fun_data_1 = {
            'select',
            'rename',
            'mutate',
            'filter',
            'relocate',
            'summarise',
          },
        }
      end,
    },
  },
  lazy = false,
  config = function()
    local opts = {
      auto_start = 'always',
      auto_quit = true,
      active_window_warn = false,
    }
    require('r').setup(opts)
    vim.g.rout_follow_colorscheme = true

    -- Keybinding to view R tables using DT
    local function show_table()
      local node = vim.treesitter.get_node { ignore_injections = false }
      local text = vim.treesitter.get_node_text(node, 0)
      local cmd = [[call slime#send("DT::datatable(]] .. text .. [[)" . "\r")]]
      vim.cmd(cmd)
    end

    vim.keymap.set('n', '<leader>rt', show_table, { desc = '[R] [T]able' })

    -- Keybinding to insert pipe
    vim.keymap.set('i', '<m-m>', ' |>')
  end,
}
