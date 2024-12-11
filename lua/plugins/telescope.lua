-- Fuzzy finder
return {
  {
    'nvim-telescope/telescope.nvim',
    event = 'VimEnter',
    branch = '0.1.x',
    dependencies = {
      'nvim-lua/plenary.nvim',
      { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
      { 'nvim-telescope/telescope-frecency.nvim' },
      { 'nvim-telescope/telescope-ui-select.nvim' },
      -- List references from local Zotero library and add them to existing bib file
      {
        'jmbuhr/telescope-zotero.nvim',
        dependencies = {
          { 'kkharji/sqlite.lua' },
        },
        main = 'zotero',
        opts = {
          zotero_db_path = '/home/loki/.local/share/zotero/zotero.sqlite',
          better_bibtex_db_path = '/home/loki/.local/share/zotero/better-bibtex.sqlite',
        },
      },
      -- Useful for getting pretty icons, but requires special font.
      --  If you already have a Nerd Font, or terminal set up with fallback fonts
      --  you can enable this
      { 'nvim-tree/nvim-web-devicons' },
    },
    config = function()
      -- [[ Configure Telescope ]]
      local actions = require 'telescope.actions'
      require('telescope').setup {
        defaults = {
          prompt_prefix = ' ',
          selection_caret = ' ',
          sorting_strategy = 'ascending',
          layout_strategy = 'flex',
          layout_config = {
            flex = {
              prompt_position = 'top',
              flip_columns = 160,
            },
            horizontal = {
              preview_width = 80,
            },
          },
          mappings = {
            i = {
              ['<esc>'] = actions.close,
            },
          },
        },
        extensions = {
          fzf = {
            fuzzy = true,
            override_generic_sorter = true,
            override_file_sorter = true,
            case_mode = 'smart_case',
          },
          frecency = {
            db_safe_mode = false,
          },
          ['ui-select'] = {
            require('telescope.themes').get_dropdown(),
          },
        },
      }

      -- Enable telescope extensions, if they are installed
      require('telescope').load_extension 'ui-select'
      require('telescope').load_extension 'fzf'
      require('telescope').load_extension 'frecency'
    end,
    keys = {
      { '<leader>sh', '<cmd>Telescope help_tags<cr>', desc = '[S]earch [h]elp' },
      { '<leader>sH', '<cmd>Telescope search_history<cr>', desc = '[S]earch [H]istory' },
      { '<leader>sk', '<cmd>Telescope keymaps<cr>', desc = '[S]earch [k]eymaps' },
      { '<leader>sf', '<cmd>Telescope find_files<cr>', desc = '[S]earch [f]iles' },
      { '<leader>ss', '<cmd>Telescope spell_suggest<cr>', desc = '[S]earch [s]pellings' },
      { '<leader>sw', '<cmd>Telescope grep_string<cr>', desc = '[S]earch [w]ord under cursor' },
      { '<leader>sg', '<cmd>Telescope live_grep<cr>', desc = '[S]earch with [g]rep in all files in folder' },
      { '<leader>sd', '<cmd>Telescope diagnostics<cr>', desc = '[S]earch [d]iagnostics' },
      { '<leader>sz', '<cmd>Telescope zotero<cr>', desc = '[S]earch [Z]otero' },
      { '<leader>sr', '<cmd>Telescope resume<cr>', desc = '[S]earch [r]esume' },
      { '<leader>s.', '<cmd>Telescope frecency<cr>', desc = '[S]earch recent files' },
      { '<leader><leader>', '<cmd>Telescope buffers<cr>', desc = '[] Search for existing buffers' },
      { '<leader>/', '<cmd>Telescope current_buffer_fuzzy_find<cr>', desc = '[/] Fuzzy search in buffer' },
      {
        '<leader>sG',
        function()
          require('plugins.functions.multigrep').setup()
        end,
        desc = '[S]earch with [G]lobbing',
      },
      {
        '<leader>s/',
        function()
          require('telescope.builtin').live_grep {
            grep_open_files = true,
            prompt_title = 'Live grep in open files',
          }
        end,
        desc = '[S]earch [/] in open files',
      },
      {
        '<leader>sn',
        function()
          require('telescope.builtin').find_files {
            cwd = vim.fn.stdpath 'config',
          }
        end,
        desc = '[S]earch [n]eovim files',
      },
    },
  },
}
