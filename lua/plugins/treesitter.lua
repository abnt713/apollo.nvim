local settings = require('apollo.context').settings.treesitter

return {
	'nvim-treesitter/nvim-treesitter',
	opts = {
		ensure_installed = settings.ensure_installed,
		highlight = {
			enabled = true
		}
	}
}
