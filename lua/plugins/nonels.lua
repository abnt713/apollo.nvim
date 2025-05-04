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

local settings = require('apollo.context').settings
local cfg = settings.nonels

return {
  "nvimtools/none-ls.nvim",
  dependencies = {
    'williamboman/mason.nvim',
    'jay-babu/mason-null-ls.nvim'
  },
  config = function()
    local null_ls = require('null-ls')

    local keymap = vim.api.nvim_set_keymap
    local mapdefaults = { noremap = true }
    keymap('n', cfg.mappings.toggle_revive, "<cmd>lua require('null-ls').toggle({name = 'revive'})<CR>", mapdefaults)

    -- local revive_args = {
    --   "-formatter",
    --   "json",
    -- }

    -- local gotags = settings.general.go.tags
    -- if gotags ~= '' then
    --   table.insert(revive_args, "-tags")
    --   table.insert(revive_args, gotags)
    -- end

    -- table.insert(revive_args, "./...")

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
