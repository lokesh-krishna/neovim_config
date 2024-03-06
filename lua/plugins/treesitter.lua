-- Highlight, edit, and navigate code
return {
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    config = function()
      -- [[ Configure Treesitter ]] See `:help nvim-treesitter`

      ---@diagnostic disable-next-line: missing-fields
      require('nvim-treesitter.configs').setup {
        -- Autoinstall languages that are not installed
        ensure_installed = {
          'bash',
          'cmake',
          'comment',
          'css',
          'devicetree',
          'dart',
          'dockerfile',
          'fish',
          'hjson',
          'html',
          'http',
          'javascript',
          'json5',
          'jsonc',
          'julia',
          'latex',
          'ledger',
          'lua',
          'make',
          'markdown',
          'markdown_inline',
          'ninja',
          'php',
          'python',
          'query',
          'r',
          'regex',
          'ron',
          'rust',
          'scss',
          'toml',
          'vim',
          'vimdoc',
          'yaml',
        },
        highlight = { enable = true },
        indent = { enable = true },
      }

      -- There are additional nvim-treesitter modules that you can use to interact
      -- with nvim-treesitter. You should go explore a few and see what interests you:
      --
      --    - Incremental selection: Included, see `:help nvim-treesitter-incremental-selection-mod`
      --    - Show your current context: https://github.com/nvim-treesitter/nvim-treesitter-context
      --    - Treesitter + textobjects: https://github.com/nvim-treesitter/nvim-treesitter-textobjects
    end,
  },
}
