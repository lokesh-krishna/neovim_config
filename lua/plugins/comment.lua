return {
  -- "gc" to comment visual regions/lines
  {
    'numToStr/Comment.nvim',
    config = function()
      local ft = require 'Comment.ft'
      ft.set('hyprlang', '#%s')

      require('Comment').setup()
    end,
  },
}
