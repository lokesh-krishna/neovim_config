-- Running code in Quarto documents
local runner = require 'quarto.runner'
vim.keymap.set('n', '<localleader>rc', runner.run_cell, { desc = 'run cell', silent = true })
vim.keymap.set('n', '<localleader>ra', runner.run_above, { desc = 'run cell and above', silent = true })
vim.keymap.set('n', '<localleader>rA', runner.run_all, { desc = 'run all cells', silent = true })
vim.keymap.set('n', '<localleader>rl', runner.run_line, { desc = 'run line', silent = true })
vim.keymap.set('v', '<localleader>r', runner.run_range, { desc = 'run visual range', silent = true })

-- Assignment and pipe operators
vim.keymap.set('i', '<M-->', ' <- ', { buffer = true })
vim.keymap.set('i', '<M-m>', ' |>', { buffer = true })

-- Quarto preview
vim.keymap.set('n', '<leader>qp', ':QuartoPreview<cr>', { desc = 'Quarto Preview' })
vim.keymap.set('n', '<leader>qs', ':QuartoClosePreview<cr>', { desc = 'Close Quarto Preview' })

-- Launch terminal
vim.keymap.set('n', '<leader>ri', ':split term://R<cr>', { desc = '[r] [i]nsert' })

-- Fix indenting in R
vim.g.r_indent_align_args = 0
