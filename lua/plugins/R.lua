return {
  'R-nvim/R.nvim',
  config = function()
    require('cmp_r').setup {}
    local opts = {
      auto_start = 'always',
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

    vim.keymap.set('n', '<leader>dt', show_table, { desc = '[D]ata [T]able' })

    -- Keybinding to insert pipe
    vim.keymap.set('i', '<m-m>', ' |>')
  end,
  lazy = false,
}
