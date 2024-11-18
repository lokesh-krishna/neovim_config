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
        '<leader>lg',
        '<cmd>LazyGitCurrentFile<cr>',
        desc = 'LazyGit',
      },
    },
  },
}
