local revive_index = 0

local function apply_revive_fix()
  vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = { "*.go" },
    callback = function()
      local srcs = require('null-ls.sources').get_all()

      if (revive_index ~= 0) then
        srcs[revive_index].generator._failed = false
        return
      end

      for i, source in pairs(srcs) do
        if (source.name == "revive") then
          revive_index = i
          source.generator._failed = false
          return
        end
      end
    end
  })
end

return {
  "nvimtools/none-ls.nvim",
  dependencies = {
    'williamboman/mason.nvim',
    'jay-babu/mason-null-ls.nvim'
  },
  config = function()
    local null_ls = require('null-ls')

    -- local keymap = vim.api.nvim_set_keymap
    -- local mapdefaults = { noremap = true }
    -- keymap('n', cfg.map.toggle_revive, "<cmd>lua require('null-ls').toggle({name = 'revive'})<CR>", mapdefaults)

    require('null-ls').setup {
      sources = {
        null_ls.builtins.diagnostics.revive,
        null_ls.builtins.formatting.goimports,
        null_ls.builtins.formatting.gofumpt,
      }
    }

    apply_revive_fix()
    require('mason-null-ls').setup { automatic_installation = true }
  end
}
