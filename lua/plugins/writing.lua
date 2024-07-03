return {
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
}
