local settings = {
	editor = {
		colorcolumn = '80',
		indent_size = 4,
		cursorline = true
	}
}

local ctx = {
	settings = settings,
}

local function load_local_context()
	local success, local_ctx_fn = pcall(require, 'apollo.local')
	if not success then
		return ctx
	end

	return local_ctx_fn(ctx)
end

return load_local_context()
