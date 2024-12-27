local function main()
	-- Retrieving the editor context.
	local ctx = require('apollo.context')

	-- Loading editor settings.
	require('apollo.editor').load(ctx)
end

main()
