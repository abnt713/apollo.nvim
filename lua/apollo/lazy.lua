local M = {}

local function bootstrap()
	-- Bootstrap lazy.nvim
	local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
	if not (vim.uv or vim.loop).fs_stat(lazypath) then
		print('Lazy not installed... Installing...')
		local lazyrepo = "https://github.com/folke/lazy.nvim.git"
		local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
		if vim.v.shell_error ~= 0 then
			vim.api.nvim_echo({
				{ "Failed to clone lazy.nvim:\n", "ErrorMsg" },
				{ out, "WarningMsg" },
				{ "\nPress any key to exit..." },
			}, true, {})
			vim.fn.getchar()
			os.exit(1)
		end
	end
	vim.opt.rtp:prepend(lazypath)
end

local function set_leaders()
	vim.g.mapleader = " "
	vim.g.maplocalleader = "\\"
end

local function setup()
	require('lazy').setup({
		spec = { import = 'plugins'},
		ui = {
			border = 'rounded'
		}
	})
end

function M.load()
	set_leaders()
	bootstrap()
	setup()
end

return M
