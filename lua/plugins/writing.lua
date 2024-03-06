return {
  {
    'folke/zen-mode.nvim',
    config = function()
      require('zen-mode').setup {
        window = {
          backdrop = 1,
          height = 0.95,
          options = {
            relativenumber = false,
            number = false,
          },
        },
        plugins = {
          options = {
            ruler = true,
          },
        },
        twilight = { enabled = false },
      }
      vim.keymap.set('n', '<leader>wz', '<cmd>:ZenMode<CR>', { desc = '[W]riting in [Z]en Mode' })
    end,
  },
  {
    'folke/twilight.nvim',
    config = function()
      vim.keymap.set('n', '<leader>wt', '<cmd>:Twilight<CR>', { desc = '[W]riting in [T]wilight' })
    end,
  },
}
