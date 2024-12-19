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

-- terminal customisation
vim.api.nvim_create_autocmd('TermOpen', {
  desc = 'disable line numbers and easily enter normal mode',
  group = vim.api.nvim_create_augroup('custom-term-open', { clear = true }),
  callback = function()
    vim.opt.number = false
    vim.opt.relativenumber = false
  end,
})
