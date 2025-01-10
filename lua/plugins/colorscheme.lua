return {
  'nyoom-engineering/oxocarbon.nvim',
  priority = 1000,
  config = function()
    vim.o.background = 'dark'
    vim.cmd 'colorscheme oxocarbon'
  end,
  opts = {},
}
