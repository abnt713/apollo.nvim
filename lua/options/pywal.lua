return {
  'uZer/pywal16.nvim',
  name = 'pywal16',
  priority = 1000,
  config = function()
    local pywal16 = require('pywal16')
    pywal16.setup()
    vim.cmd.colorscheme("pywal16")
  end,
}
