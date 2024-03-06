return {
  'nvim-tree/nvim-tree.lua',
  config = function()
    require('nvim-tree').setup {
      view = {
        width = 40,
        number = true,
        relativenumber = true,
      },
    }
    vim.keymap.set('n', '<leader>nt', '<cmd>:NvimTreeToggle<CR>', { desc = '[N]vim-tree [T]oggle' })
  end,
}
