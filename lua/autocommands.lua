-- Highlight when yanking (copying) text
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
vim.api.nvim_create_autocmd({ 'FileType' }, {
  desc = 'Better wrapping for long lines',
  pattern = { '*.md', '*.qmd' },
  group = vim.api.nvim_create_augroup('pencil', { clear = true }),
  command = 'set linebreak',
})

-- Disable line numbers for terminal
vim.api.nvim_create_autocmd('TermOpen', {
  desc = 'remove line numbers in terminals',
  group = vim.api.nvim_create_augroup('terminal-line-numbers', { clear = true }),
  command = 'setlocal nonumber norelativenumber',
})
