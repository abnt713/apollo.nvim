return {
  "Shatur/neovim-ayu",
  lazy = false,
  priority = 1000,
  config = function()
    vim.o.background = 'dark'
    vim.cmd 'colorscheme ayu-dark'
  end,
  opts = {},
}
