return {
  'quarto-dev/quarto-nvim',
  dependencies = {
    {
      'jmbuhr/otter.nvim',
      opts = {},
    },
  },
  config = function()
    require('quarto').setup {
      lspFeatures = {
        languages = { 'python', 'julia' },
      },
    }
    vim.keymap.set('n', '<leader>qp', '<cmd>:QuartoPreview<cr>', { desc = '[Q]uarto [P]review' })
    vim.keymap.set('n', '<leader>qs', '<cmd>:QuartoClosePreview<cr>', { desc = '[Q]uarto [S]top Preview' })
  end,
}
