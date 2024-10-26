-- Plugins with no configuration or single line configuration
return {
  -- Highlight todo, notes, etc in comments
  { 'folke/todo-comments.nvim', event = 'VimEnter', opts = { signs = false } },

  -- Color highlighter
  {
    'norcalli/nvim-colorizer.lua',
    config = function()
      require('colorizer').setup {
        '*',
      }
    end,
  },

  -- Syntax highlighting for typst
  {
    'kaarmu/typst.vim',
    ft = 'typst',
    lazy = false,
  },

  -- Syntax highlighting for kitty config
  'fladson/vim-kitty',

  -- Interactive vertical scrollbar
  {
    'dstein64/nvim-scrollview',
    opts = {
      current_only = true,
    },
  },
}
