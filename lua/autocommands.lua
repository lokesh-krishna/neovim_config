-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- Set filetype for certain files
vim.filetype.add {
  filename = {
    ['.Rprofile'] = 'r',
    ['hyprland.conf'] = 'conf',
    ['config'] = 'conf',
  },
  extension = {
    config = 'conf',
  },
}

-- Replicate vim-pencil
vim.api.nvim_create_autocmd({ 'BufNewFile', 'BufRead' }, {
  desc = 'Better wrapping for long lines',
  pattern = { '*.md', '*.qmd' },
  group = vim.api.nvim_create_augroup('pencil', { clear = true }),
  command = 'set linebreak',
})
