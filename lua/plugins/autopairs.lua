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
      local cond = require 'nvim-autopairs.conds'
      -- $$ for quarto
      npairs.add_rule(Rule('$', '$', 'quarto'):with_move(cond.done()))
      -- <> for everything but R
      npairs.add_rule(Rule('<', '>', '-r'):with_move(cond.done()))
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
