return {
  {
    'saghen/blink.compat',
    version = '*',
    opts = {},
  },
  {
    'saghen/blink.cmp',
    version = 'v0.*',
    dependencies = {
      {
        'L3MON4D3/LuaSnip',
        version = 'v2.*',
        build = (function()
          -- Build Step is needed for regex support in snippets
          -- This step is not supported in many windows environments
          -- Remove the below condition to re-enable on windows
          if vim.fn.has 'win32' == 1 or vim.fn.executable 'make' == 0 then
            return
          end
          return 'make install_jsregexp'
        end)(),
        dependencies = {
          'rafamadriz/friendly-snippets',
          config = function()
            -- for friendly snippets
            require('luasnip.loaders.from_vscode').lazy_load()
            -- -- for custom snippets
            require('luasnip.loaders.from_vscode').lazy_load { paths = { './snips' } }
          end,
        },
      },
      'f3fora/cmp-spell',
      'kdheepak/cmp-latex-symbols',
      'jmbuhr/cmp-pandoc-references',
      {
        'R-nvim/cmp-r',
        fun_data_1 = {
          'select',
          'rename',
          'mutate',
          'filter',
          'arrange',
        },
      },
    },
    opts = {
      appearance = {
        use_nvim_cmp_as_default = false,
        nerd_font_variant = 'mono',
      },
      signature = { enabled = true },
      snippets = {
        expand = function(snippet)
          require('luasnip').lsp_expand(snippet)
        end,
        active = function(filter)
          if filter and filter.direction then
            return require('luasnip').jumpable(filter.direction)
          end
          return require('luasnip').in_snippet()
        end,
        jump = function(direction)
          require('luasnip').jump(direction)
        end,
      },
      sources = {
        completion = {
          enabled_providers = { 'lsp', 'path', 'luasnip', 'buffer', 'spell', 'latex_symbols', 'pandoc_references', 'cmp_r' },
        },
        providers = {
          spell = {
            name = 'spell',
            module = 'blink.compat.source',
          },
          latex_symbols = {
            name = 'latex_symbols',
            module = 'blink.compat.source',
          },
          pandoc_references = {
            name = 'pandoc_references',
            module = 'blink.compat.source',
          },
          cmp_r = {
            name = 'cmp_r',
            module = 'blink.compat.source',
          },
        },
      },
    },
  },
}
