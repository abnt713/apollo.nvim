local settings = require('apollo.context').settings
local cfg = settings.octo

return {
  'pwntester/octo.nvim',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-telescope/telescope.nvim',
    'nvim-tree/nvim-web-devicons',
  },
  config = function()
    require('octo').setup({
      enable_builtin = true,
    })

    local keymap = vim.api.nvim_set_keymap
    local mapdefaults = { noremap = true }
    keymap("n", cfg.mappings.builtin, "<cmd>Octo<cr>", mapdefaults)
  end
}
