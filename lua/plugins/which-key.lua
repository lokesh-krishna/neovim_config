-- Show pending keybinds
return {
  { -- Useful plugin to show you pending keybinds.
    'folke/which-key.nvim',
    event = 'VimEnter',
    opts = {
      preset = 'modern',
      spec = {
        { '<leader>c', group = '[C]ode', mode = { 'n', 'x' } },
        { '<leader>b', group = '[B]ullet', mode = { 'n', 'x' } },
        { '<leader>d', group = '[D]ebug' },
        { '<leader>e', group = '[E]rrors' },
        { '<leader>f', group = '[F]ind' },
        { '<leader>l', group = '[L]SP' },
        { '<leader>n', group = '[N]vim-Tree/[N]otifications' },
        { '<leader>p', group = '[P]lugins' },
        { '<leader>T', group = '[T]rouble' },
        { '<leader>r', group = '[R]ename' },
        { '<leader>s', group = '[S]earch' },
        { '<leader>w', group = '[W]orkspace' },
        { '<leader>t', group = '[T]oggle' },
        { '<leader>h', group = 'Git [H]unk', mode = { 'n', 'v' } },
        -- Keybinding descriptions for autolist
        { '<leader>bn', desc = 'Next bullet style' },
        { '<leader>bp', desc = 'Previous bullet style' },
      },
    },
  },
}
