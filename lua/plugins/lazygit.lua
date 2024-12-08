-- access lazygit from within neovim
return {
  {
    'kdheepak/lazygit.nvim',
    lazy = true,
    cmd = {
      'LazyGit',
      'LazyGitConfig',
      'LazyGitCurrentFile',
      'LazyGitFilter',
      'LazyGitFilterCurrentFile',
    },
    keys = {
      {
        '<leader>pg',
        '<cmd>LazyGitCurrentFile<cr>',
        desc = '[P]lugin: Lazy[G]it',
      },
    },
  },
}
