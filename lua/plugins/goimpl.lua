local cfg = require('apollo.context').settings.goimpl
return {
  "edolphin-ydf/goimpl.nvim",
  ft = "go",
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-lua/popup.nvim',
    'nvim-telescope/telescope.nvim',
    'nvim-treesitter/nvim-treesitter'
  },
  config = function()
    require('telescope').load_extension('goimpl')
    local keymap = vim.api.nvim_set_keymap
    local mapdefaults = { noremap = true }
    keymap('n', cfg.mappings.show_impl, '<cmd>lua require("telescope").extensions.goimpl.goimpl({})<CR>', mapdefaults)
  end
}
