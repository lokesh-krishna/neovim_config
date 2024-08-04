return {
  {
    'folke/zen-mode.nvim',
    opts = {
      backdrop = 1,
      height = 0.95,
      plugins = {
        options = {
          enabled = true,
          ruler = true,
        },
        twilight = { enabled = false },
      },
    },
    keys = {
      {
        '<leader>wz',
        '<cmd>:ZenMode<CR>',
        desc = '[Writing] in [Zen] Mode',
      },
    },
  },
  {
    'folke/twilight.nvim',
    keys = {
      {
        '<leader>wt',
        '<cmd>:Twilight<CR>',
        desc = '[W]riting in [T]wilight',
      },
    },
  },
  {
    'epwalsh/obsidian.nvim',
    version = '*',
    lazy = true,
    -- ft = 'markdown',
    event = {
      'BufReadPre /home/loki/documents/notes/*.md',
      'BufNewFile /home/loki/documents/notes/*.md',
    },
    opts = {
      workspaces = {
        {
          name = 'personal',
          path = '~/documents/notes',
        },
      },
      completion = {
        nvim_cmp = true,
        min_chars = 2,
      },
      new_notes_location = 'notes_subdir',
      picker = {
        name = 'telescope.nvim',
        note_mappings = {
          new = '<C-x>',
          insert_link = '<C-l>',
        },
        tag_mappings = {
          tag_note = '<C-x>',
          insert_tag = '<C-l>',
        },
      },
    },
  },
}
