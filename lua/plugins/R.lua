return {
  'R-nvim/R.nvim',
  lazy = false,
  dependencies = {
    { 'R-nvim/cmp-r' },
  },
  config = function()
    local opts = {
      auto_start = 'always',
      auto_quit = true,
      Rout_more_colors = true,
    }
    require('r').setup(opts)

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
