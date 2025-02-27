-- Assignment and pipe operators
vim.keymap.set('i', '<M-->', ' <- ', { buffer = true })
vim.keymap.set('i', '<M-m>', ' |>', { buffer = true })

-- Fix indenting in R
vim.g.r_indent_align_args = 0

-- Better linebreaks
vim.opt.linebreak = true

-- Use knitr to generate and preview pdf
-- vim.keymap.set('n', '<LocalLeader>rk', '<Plug>RBibTeXK<cr>', { desc = 'Generate and preview pdf' })
