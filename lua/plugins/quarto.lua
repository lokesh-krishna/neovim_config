return {
  {
    'quarto-dev/quarto-nvim',
    opts = {
      codeRunner = {
        enabled = true,
        default_method = 'slime',
      },
    },
    dependencies = {
      {
        'jmbuhr/otter.nvim',
        opts = {},
      },
      {
        'jpalardy/vim-slime',
        init = function()
          vim.g.slime_target = 'neovim'
          vim.g.slime_cell_delimiter = '#\\s\\=%%'
          vim.g.slime_no_mappings = true
        end,
        config = function()
          -- launch R terminal
          vim.keymap.set('n', '<leader>ri', ':25split term://R<cr>', { desc = '[r] [i]nsert' })
          -- send paragraph to Slime
          vim.keymap.set('n', '<M-cr>', '<Plug>SlimeParagraphSend<cr>', { desc = 'Send paragraph to Slime' })
          -- send lien to Slime
          vim.keymap.set('n', '<M-i>', '<Plug>SlimeLineSend<cr>', { desc = 'Send line to Slime' })
        end,
      },
    },
  },
}
