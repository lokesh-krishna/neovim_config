--  See `:help vim.keymap.set()`
local set = vim.keymap.set

-- Run lua code more easily
set('n', '<leader>cf', ':source %<cr>', { desc = '[C]ode: Run [F]ile' })
set('n', '<leader>cl', ':.lua<cr>', { desc = '[C]ode: Rule [L]ine' })
set('v', '<leader>cl', ':lua<cr>', { desc = '[C]ode: Rule [L]ine' })

-- Set highlight on search, but clear on pressing <Esc> in normal mode
set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- quickfix movement
set('n', '<M-j>', '<cmd>cnext<cr>', { desc = 'Move to next quickfix list item' })
set('n', '<M-k>', '<cmd>cprev<cr>', { desc = 'Move to previous quickfix list item' })

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

-- Plugin
set('n', '<leader>pm', ':Mason<cr>', { desc = '[P]lugin: [M]ason' })
set('n', '<leader>pl', ':Lazy<cr>', { desc = '[P]lugin: [L]azy' })

-- Grug-Far
set('n', '<leader>fg', ':GrugFar<cr>', { desc = '[F]ind [G]lobally' })
set('n', '<leader>fw', ':lua require("grug-far").grug_far({prefills = { search = vim.fn.expand("<cword>")}})<cr>', { desc = '[F]ind current [W]ord' })
set(
  'n',
  '<leader>fv',
  ':<C-u>lua require("grug-far").with_visual_selection( { prefills = { paths = vim.fn.expand("%") } } )',
  { desc = '[F]ind [V]isual selection' }
)
set('n', '<leader>fb', ':lua require("grug-far").grug_far({prefills = { paths = vim.fn.expand("%")}})<cr>', { desc = '[F]ind in [B]uffer' })
