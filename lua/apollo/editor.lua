local M = {}

local function apply_neovide()
  if not vim.g.neovide then
    return
  end

  vim.o.guifont = "Cartograph CF:h12"

  -- Split
  vim.g.neovide_position_animation_length = 0.10

  -- Scroll
  vim.g.neovide_scroll_animation_length = 0.1

  -- Cursor
  vim.g.neovide_cursor_animation_length = 0.05
  vim.g.neovide_cursor_trail_size = 0.1
  vim.g.neovide_cursor_antialiasing = false

  -- Animations
  vim.g.neovide_cursor_animate_in_insert_mode = false
  vim.g.neovide_cursor_animate_command_line = false

  -- Mouse
  vim.g.neovide_hide_mouse_when_typing = false
end

M.load = function()
  local settings = require('apollo.context').settings.editor

  -- General settings
  vim.wo.relativenumber = true
  vim.wo.number = true
  vim.wo.signcolumn = 'yes'
  vim.wo.cursorline = settings.cursorline
  vim.opt.colorcolumn = settings.colorcolumn
  vim.o.winborder = 'single'

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

  apply_neovide()
end

return M
