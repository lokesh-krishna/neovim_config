return {
  'quarto-dev/quarto-nvim',
  opts = {
    lspFeatures = {
      languages = { 'python', 'julia' },
    },
  },
  dependencies = {
    'jmbuhr/otter.nvim',
    opts = {},
  },
}
