return {
  'nvim-lualine/lualine.nvim',
  config = function()
    -- Define colors
    local colors = {
      blue = '#89b4fa',
      black = '#1e1e2e',
      black2 = '#11111b',
      white = '#cdd6f4',
      red = '#f38ba8',
      violet = '#cba6f7',
      green = '#a6e3a1',
      grey = '#313244',
      light_grey = '#6c7086',
    }

    -- Define theme using colors
    local bubbles_theme = {
      normal = {
        a = { fg = colors.black, bg = colors.blue },
        b = { fg = colors.white, bg = colors.grey },
        c = { fg = colors.light_grey, bg = colors.black },
      },

      insert = { a = { fg = colors.black, bg = colors.green } },
      visual = { a = { fg = colors.black, bg = colors.violet } },
      replace = { a = { fg = colors.black, bg = colors.red } },

      inactive = {
        a = { fg = colors.white, bg = colors.black2 },
        b = { fg = colors.white, bg = colors.black2 },
        c = { fg = colors.black2, bg = colors.black2 },
      },
    }

    local function wordcount()
      return tostring(vim.fn.wordcount().words) .. ' words'
    end

    local function is_writing()
      return vim.bo.filetype == 'markdown' or vim.bo.filetype == 'quarto'
    end

    require('lualine').setup {
      options = {
        icons_enabled = true,
        disabled_filetypes = { 'NvimTree' },
        theme = bubbles_theme,
        component_separators = '|',
        section_separators = { left = '', right = '' },
      },
      sections = {
        lualine_a = {
          { 'mode', separator = { left = '' }, right_padding = 2 },
        },
        lualine_b = { 'filename', 'branch' },
        lualine_c = {},
        lualine_x = { { wordcount, cond = is_writing } },
        lualine_y = { 'filetype', 'progress' },
        lualine_z = {
          { 'location', separator = { right = '' }, left_padding = 2 },
        },
      },
      inactive_sections = {
        lualine_a = { 'filename' },
        lualine_b = {},
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = { 'location' },
      },
      tabline = {
        lualine_a = {
          { 'tabs', separator = { left = '', right = '' }, right_padding = 2 },
        },
        lualine_b = {},
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = {},
      },
    }
  end,
}
