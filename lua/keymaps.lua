--  See `:help vim.keymap.set()`
local set = vim.keymap.set

-- Run lua code more easily
set('n', '<leader>rc', '<cmd>source %<cr>', { desc = 'Run current file' })
set('n', '<leader>rl', ':.lua<cr>', { desc = 'Run current line' })
set('v', '<leader>rl', ':lua<cr>', { desc = 'Run current line' })

-- Set highlight on search, but clear on pressing <Esc> in normal mode
set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostic keymaps
set('n', '<leader>eq', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })
set('n', '<leader>es', vim.diagnostic.open_float, { desc = 'Hover diagnostic' })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- Control split sizes
set('n', '<M-,>', '<c-w>5<', { desc = 'Shrink split horizontally' })
set('n', '<M-.>', '<c-w>5>', { desc = 'Expand split horizontally' })

-- Mason
set('n', '<leader>m', ':Mason<cr>', { desc = 'Portable package manager for LSPs, linters and formatters' })

-- Lazy
set('n', '<leader>ll', ':Lazy<cr>', { desc = 'Plugin manager' })

-- Grug-Far
set('n', '<leader>gg', ':GrugFar<cr>', { desc = 'Global search and replace' })

set('n', '<leader>gw', ':lua require("grug-far").grug_far({prefills = { search = vim.fn.expand("<cword>")}})<cr>', { desc = 'Search for word under cursor' })

set('n', '<leader>gt', ':lua require("grug-far").grug_far({transient = true })<cr>', { desc = 'Launch as a transient buffer' })

set(
  'n',
  '<leader>gl',
  ':lua require("grug-far").grug_far({prefills = { paths = vim.fn.expand("%")}})<cr>',
  { desc = 'Limit search and replace to current file' }
)
