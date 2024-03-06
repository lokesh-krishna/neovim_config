-- Colorscheme
return {
  {
    'catppuccin/nvim',
    name = 'catppuccin',
    lazy = false, -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
      -- Load the colorscheme here
      require('catppuccin').setup {
        integrations = {
          notify = true,
          which_key = true,
          headlines = true,
          mason = true,
          lsp_trouble = true,
        },
        custom_highlights = function(colors)
          return {
            TelescopeSelection = {
              fg = colors.text,
              bg = colors.surface1,
              style = { 'bold' },
            },
          }
        end,
      }
      vim.cmd.colorscheme 'catppuccin'
    end,
  },
}
