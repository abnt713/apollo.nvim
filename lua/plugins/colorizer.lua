local cfg = require('apollo.context').settings.colorizer

return {
  "chrisbra/colorizer",
  cmd = "ColorToggle",
  init = function()
    local keymap = vim.api.nvim_set_keymap
    local mapdefaults = { noremap = true }
    keymap('n', cfg.mappings.colorize, '<cmd>ColorToggle<CR>', mapdefaults)
  end
}
