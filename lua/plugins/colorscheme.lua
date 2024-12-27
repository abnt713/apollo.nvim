return {
  "rafamadriz/neon",
  lazy = false,
  priority = 1000,
  config = function()
	  vim.g.neon_style = 'dark'
	  vim.cmd([[colorscheme neon]])
  end,
  opts = {},
}
