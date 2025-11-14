-- [[ Set up lazy.nvim (Plugin Manager) ]]
-- This must be at the very top of your configuration
local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', 
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)
-- [[ Global Settings ]]

-- Set space as the leader key.
-- This is the most important setting, making all custom shortcuts ergonomic.
vim.g.mapleader = ' '

-- [[ Core Neovim Options ]]
-- See `:h vim.o` for a full list of options

-- Enable line numbers
vim.o.number = true

-- Sync clipboard between OS and Neovim
vim.api.nvim_create_autocmd('UIEnter', {
  callback = function()
    vim.o.clipboard = 'unnamedplus'
  end,
})

-- Enable smart case-insensitive searching
vim.o.ignorecase = true
vim.o.smartcase = true

-- Highlight the line where the cursor is
vim.o.cursorline = true

-- Keep a few lines of context around the cursor when scrolling
vim.o.scrolloff = 10

-- Show visible characters for tabs and trailing spaces
vim.o.list = true

-- Prompt to save unsaved changes before quitting
vim.o.confirm = true

-- [[ Keymaps ]]
-- See `:h vim.keymap.set()` for reference

-- Exit terminal mode with <Esc>
vim.keymap.set('t', '<Esc>', '<C-\\><C-n>')

-- Window navigation using Alt + h/j/k/l in all modes
vim.keymap.set({ 'n', 't', 'i' }, '<A-h>', '<C-\\><C-n><C-w>h')
vim.keymap.set({ 'n', 't', 'i' }, '<A-j>', '<C-\\><C-n><C-w>j')
vim.keymap.set({ 'n', 't', 'i' }, '<A-k>', '<C-\\><C-n><C-w>k')
vim.keymap.set({ 'n', 't', 'i' }, '<A-l>', '<C-\\><C-n><C-w>l')

-- Custome Layout

function setup_dev_layout()
    vim.cmd('only')
    vim.cmd('vsplit')
    vim.cmd('vertical resize 100')
    vim.cmd('wincmd l')
    vim.cmd('terminal')
    vim.cmd('split')
    vim.cmd('wincmd j')
    vim.cmd('terminal')
    vim.cmd('wincmd h')
end

vim.keymap.set('n', '<leader>l', setup_dev_layout, { desc = 'Setup dev layout' })

-- [[ Theme ]]
vim.cmd.colorscheme 'moegi-light'
-- [[ Autocommands ]]
-- See `:h nvim_create_autocmd()`

-- Highlight text on yank (copy)
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  callback = function()
    vim.hl.on_yank()
  end,
})

-- Load the 'nohlsearch' package to automatically clear search highlights
vim.cmd('packadd! nohlsearch')

-- init.lua:
require("lazy").setup({
    { 'nvim-tree/nvim-web-devicons', lazy = true},
    {
    'nvim-telescope/telescope.nvim', tag = '0.1.9',
     dependencies = { 'nvim-lua/plenary.nvim' },
     config = function()
      local builtin = require('telescope.builtin')
      vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Find files' })
      vim.keymap.set('n', '<leader>bb', require('telescope.builtin').buffers, { desc = 'Find open buffers' })
      vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
    end
    },
    {
     'mason-org/mason.nvim',
     opts = {}
    }
})


