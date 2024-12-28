local settings = {
	editor = {
		colorcolumn = '80',
		indent_size = 4,
		cursorline = true
	},
	fugitive = {
		mappings = {
			git_cmd = '<leader>gs',
			commit = '<leader>gc',
			blame = '<leader>gb'
		}
	},
	telescope = {
		mappings = {
			files = '<leader>ff',
			grep = '<leader>fg',
			buffers = '<leader>fb',
			explorer = '<leader>fe'
		}
	},
	treesitter = {
		ensure_installed = {
			'go',
			'lua',
			'json',
			'markdown',
			'python',
			'c',
			'cpp',
		}
	}
}

local ctx = false

local function init_context()
	return {
		settings = settings,
	}
end

local function load_local_context()
	if ctx then
		return ctx
	end

	ctx = init_context()
	local success, local_ctx_fn = pcall(require, 'apollo.local')
	if success then
		ctx = local_ctx_fn(ctx)
	end

	return ctx
end

return load_local_context()
