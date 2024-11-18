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
        config = function()
          require('zotero').setup {
            zotero_db_path = '/home/loki/.local/share/zotero/zotero.sqlite',
            better_bibtex_db_path = '/home/loki/.local/share/zotero/better-bibtex.sqlite',
          }
          require('telescope').load_extension 'zotero'
        end,
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
        -- pickers = {}
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

      -- See `:help telescope.builtin`
      local builtin = require 'telescope.builtin'
      vim.keymap.set('n', '<leader>sh', builtin.help_tags, { desc = '[S]earch [h]elp' })
      vim.keymap.set('n', '<leader>sH', builtin.search_history, { desc = '[S]earch [H]istory' })
      vim.keymap.set('n', '<leader>sk', builtin.keymaps, { desc = '[S]earch [K]eymaps' })
      vim.keymap.set('n', '<leader>sf', builtin.find_files, { desc = '[S]earch [F]iles' })
      vim.keymap.set('n', '<leader>ss', builtin.spell_suggest, { desc = '[S]earch [s]pelling Suggestions' })
      vim.keymap.set('n', '<leader>sw', builtin.grep_string, { desc = '[S]earch current [W]ord' })
      vim.keymap.set('n', '<leader>sg', builtin.live_grep, { desc = '[S]earch by [G]rep' })
      vim.keymap.set('n', '<leader>sd', builtin.diagnostics, { desc = '[S]earch [D]iagnostics' })
      vim.keymap.set('n', '<leader>sz', '<cmd>:Telescope zotero<cr>', { desc = '[S]earch [Z]otero' })
      vim.keymap.set('n', '<leader>sr', builtin.resume, { desc = '[S]earch [R]esume' })
      vim.keymap.set('n', '<leader>s.', ':Telescope frecency<cr>', { desc = '[S]earch Recent Files ("." for repeat)' })
      vim.keymap.set('n', '<leader><leader>', builtin.buffers, { desc = '[ ] Find existing buffers' })

      -- Slightly advanced example of overriding default behavior and theme
      vim.keymap.set('n', '<leader>/', builtin.current_buffer_fuzzy_find, { desc = '[/] Fuzzily search in current buffer' })

      -- Also possible to pass additional configuration options.
      --  See `:help telescope.builtin.live_grep()` for information about particular keys
      vim.keymap.set('n', '<leader>s/', function()
        builtin.live_grep {
          grep_open_files = true,
          prompt_title = 'Live Grep in Open Files',
        }
      end, { desc = '[S]earch [/] in Open Files' })

      -- Shortcut for searching your neovim configuration files
      vim.keymap.set('n', '<leader>sn', function()
        builtin.find_files { cwd = vim.fn.stdpath 'config' }
      end, { desc = '[S]earch [n]eovim files' })
      -- Shortcut to search in my notes
      vim.keymap.set('n', '<leader>sN', function()
        builtin.find_files { cwd = '~/documents/notes' }
      end, { desc = '[S]earch [N]otes' })
    end,
  },
}
