return {
	'nvim-telescope/telescope.nvim', tag = '0.1.8',
	dependencies = {
		'nvim-lua/plenary.nvim',
		'nvim-telescope/telescope-file-browser.nvim'

	},
	config = function()
		local cfg = require('apollo.context').settings.telescope

		require('telescope').setup {
			extensions = {
				file_browser = {}
			}
		}

		local keymap = vim.api.nvim_set_keymap
		local mapdefaults = { noremap = true }

		local mappings = cfg.mappings
		keymap('n', mappings.files, "<cmd>Telescope find_files<CR>", mapdefaults)
		keymap('n', mappings.grep, "<cmd>Telescope live_grep<CR>", mapdefaults)
		keymap('n', mappings.buffers, "<cmd>Telescope buffers<CR>", mapdefaults)
		keymap('n', mappings.explorer, "<cmd>Telescope file_browser path=%:p:h cwd_to_path=true<CR>", mapdefaults)
	end
}
