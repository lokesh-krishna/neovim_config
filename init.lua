-- Set <space> as the leader key
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- [[ Setting options ]]
require 'options'

-- [[ Basic Keymaps ]]
require 'keymaps'

-- [[ Autocommands ]]
require 'autocommands'

-- [[ Bootstrapping `lazy.nvim` plugin manager ]]
require 'lazy-bootstrap'

-- [[ Setting up lazy with its plugins ]]
require 'lazy-plugins'
