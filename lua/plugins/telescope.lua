return {
  'nvim-telescope/telescope.nvim',
  tag = '0.1.8',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-telescope/telescope-file-browser.nvim'
  },
  opts = {
    defaults = {
      layout_strategy = "flex",
      layout_config = {
        horizontal = { preview_cutoff = 80, preview_width = 0.55 },
        vertical = { mirror = true, preview_cutoff = 25 },
        prompt_position = "bottom",
        width = 0.87,
        height = 0.80,
      },
    },
    extensions = {
      file_browser = {}
    }
  },
  config = function(_, opts)
    local cfg = require('apollo.context').settings.telescope

    require('telescope').setup(opts)

    local keymap = vim.api.nvim_set_keymap
    local mapdefaults = { noremap = true }

    local mappings = cfg.mappings
    keymap('n', mappings.files, "<cmd>Telescope find_files<CR>", mapdefaults)
    keymap('n', mappings.grep, "<cmd>Telescope live_grep<CR>", mapdefaults)
    keymap('n', mappings.buffers, "<cmd>Telescope buffers<CR>", mapdefaults)
    keymap('n', mappings.explorer, "<cmd>Telescope file_browser path=%:p:h cwd_to_path=true<CR>", mapdefaults)
  end
}
