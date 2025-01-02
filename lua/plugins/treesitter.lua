local settings = require('apollo.context').settings.treesitter

return {
  'nvim-treesitter/nvim-treesitter',
  opts = {
    ensure_installed = settings.ensure_installed,
    highlight = {
      enable = true,
      is_supported = function()
        local longline = vim.fn.strwidth(vim.fn.getline('.')) > 300
        if longline then
          return false
        end
        local longfile = vim.fn.getfsize(vim.fn.expand('%')) > 1024 * 1024
        if longfile then
          return false
        end
        return true
      end
    }
  },
  main = 'nvim-treesitter.configs'
}
