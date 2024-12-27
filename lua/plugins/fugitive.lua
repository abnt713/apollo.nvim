return {
	"tpope/vim-fugitive",
	config = function()
		local cfg = require('apollo.context').settings.fugitive

		local mapdefaults = { noremap = true }

		vim.api.nvim_set_keymap('n', cfg.mappings.git_cmd, '<cmd>:Git<CR>', mapdefaults)
		vim.api.nvim_set_keymap('n', cfg.mappings.commit, '<cmd>:Git commit<CR>', mapdefaults)
		vim.api.nvim_set_keymap('n', cfg.mappings.blame, '<cmd>:Git blame<CR>', mapdefaults)
	end
}
