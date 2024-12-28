local M = {}

M.load = function()
  local settings = require('apollo.context').settings.editor

  -- General settings
  vim.wo.relativenumber = true
  vim.wo.number = true
  vim.wo.signcolumn = 'yes'
  vim.wo.cursorline = settings.cursorline
  vim.opt.colorcolumn = settings.colorcolumn

  -- Indentation
  vim.bo.shiftwidth = settings.indent_size
  vim.bo.smartindent = true
  vim.bo.tabstop = settings.indent_size
  vim.bo.softtabstop = settings.indent_size

  -- Using Ctrl+C as esc
  vim.api.nvim_set_keymap('i', '<C-c>', '<ESC>', { noremap = true })

  -- File Explorer settings
  vim.g.netrw_banner = 0
  vim.g.netrw_bufsettings = 'noma nomod nu rnu nowrap ro nobl'
end

return M
