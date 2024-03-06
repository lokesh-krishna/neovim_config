-- Plugins with no configuration or single line configuration
return {
  -- Detect tabstop and shiftwidth automatically
  'tpope/vim-sleuth', -- Detect tabstop and shiftwidth automatically

  -- "gc" to comment visual regions/lines
  { 'numToStr/Comment.nvim', opts = {} },

  -- Highlight todo, notes, etc in comments
  { 'folke/todo-comments.nvim', event = 'VimEnter', dependencies = { 'nvim-lua/plenary.nvim' }, opts = { signs = false } },

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

  -- Pictograms for LSP completion items
  'onsails/lspkind.nvim',

  -- Slime
  {
    'jpalardy/vim-slime',
    init = function()
      vim.g.slime_target = 'neovim'
    end,
  },

  -- Neovim setup for init.lua and plugin development
  {
    'folke/neodev.nvim',
    opts = {},
  },

  -- Interactive vertical scrollbar
  {
    'dstein64/nvim-scrollview',
    opts = {
      current_only = true,
    },
  },

  -- Diagnostics center
  'folke/trouble.nvim',
}
