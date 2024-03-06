return {
  'rcarriga/nvim-notify',
  config = function()
    require('notify').setup {
      stages = 'slide',
      render = 'wrapped-compact',
    }
    -- Use nvim-notify as the default notification manager
    vim.notify = require 'notify'
    -- Enable notification filtering with telescope
    require('telescope').load_extension 'notify'
  end,
}
