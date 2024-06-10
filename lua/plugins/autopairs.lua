-- Auto pairs and tags by windwp
-- First, autopairs
return {
  {
    'windwp/nvim-autopairs',
    config = function()
      require('nvim-autopairs').setup {}
      local cmp_autopairs = require 'nvim-autopairs.completion.cmp'
      local cmp = require 'cmp'
      cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done())
      -- Rules
      local Rule = require 'nvim-autopairs.rule'
      local npairs = require 'nvim-autopairs'
      -- $$ for quarto
      npairs.add_rule(Rule('$$', '$$', 'quarto'))
      -- <>
      npairs.add_rule(Rule('<', '>', '-r'))
    end,
  },
  -- Next, autotags
  {
    'windwp/nvim-ts-autotag',
    config = function()
      require('nvim-ts-autotag').setup {}
    end,
  },
}
