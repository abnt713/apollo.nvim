local M = {}

M.load = function(ctx)
	-- General settings
	vim.wo.relativenumber = true
	vim.wo.number = true
	vim.wo.signcolumn = 'yes'
	vim.wo.cursorline = ctx.settings.editor.cursorline
	vim.opt.colorcolumn = ctx.settings.editor.colorcolumn

	-- Indentation
	local indent_size = ctx.settings.editor.indent_size
	vim.bo.shiftwidth = indent_size
	vim.bo.smartindent = true
	vim.bo.tabstop = indent_size
	vim.bo.softtabstop = indent_size

	-- Using Ctrl+C as esc
	vim.api.nvim_set_keymap('i', '<C-c>', '<ESC>', { noremap = true })

	-- File Explorer settings
	vim.g.netrw_banner = 0
	vim.g.netrw_bufsettings = 'noma nomod nu rnu nowrap ro nobl'
end

return M
