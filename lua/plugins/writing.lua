return {
  -- zen mode
  {
    'folke/zen-mode.nvim',
    opts = {
      backdrop = 1,
      height = 0.95,
      plugins = {
        options = {
          enabled = true,
          ruler = true,
        },
        twilight = { enabled = false },
      },
    },
    keys = {
      {
        '<leader>wz',
        '<cmd>:ZenMode<CR>',
        desc = '[Writing] in [Zen] Mode',
      },
    },
  },
  -- twilight
  {
    'folke/twilight.nvim',
    keys = {
      {
        '<leader>wt',
        '<cmd>:Twilight<CR>',
        desc = '[W]riting in [T]wilight',
      },
    },
  },
  -- autolist
  {
    'gaoDean/autolist.nvim',
    ft = {
      'markdown',
      'quarto',
      'text',
    },
    config = function()
      require('autolist').setup()

      vim.keymap.set('i', '<tab>', '<cmd>AutolistTab<cr>')
      vim.keymap.set('i', '<s-tab>', '<cmd>AutolistShiftTab<cr>')
      vim.keymap.set('i', '<CR>', '<CR><cmd>AutolistNewBullet<cr>')
      vim.keymap.set('n', 'o', 'o<cmd>AutolistNewBullet<cr>')
      vim.keymap.set('n', 'O', 'O<cmd>AutolistNewBulletBefore<cr>')
      vim.keymap.set('n', '<C-r>', '<cmd>AutolistRecalculate<cr>')

      --cycle list types with dot repeat
      vim.keymap.set('n', '<leader>cn', require('autolist').cycle_next_dr, { expr = true })
      vim.keymap.set('n', '<leader>cp', require('autolist').cycle_prev_dr, { expr = true })

      -- functions to recalculate list on edit
      vim.keymap.set('n', '>>', '>><cmd>AutolistRecalculate<cr>')
      vim.keymap.set('n', '<<', '<<<cmd>AutolistRecalculate<cr>')
      vim.keymap.set('n', 'dd', 'dd<cmd>AutolistRecalculate<cr>')
      vim.keymap.set('v', 'd', 'd<cmd>AutolistRecalculate<cr>')
    end,
  },
}
