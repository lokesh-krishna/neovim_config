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
          vim.g.slime_cell_delimiter = '```'
          vim.g.slime_no_mappings = true
        end,
        config = function()
          vim.keymap.set({ 'n', 'i' }, '<M-cr>', function()
            vim.cmd [[ call slime#send_cell()]]
          end, { desc = 'Send code cell to terminal' })
        end,
      },
    },
  },
}
