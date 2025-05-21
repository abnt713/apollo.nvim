return {
  'neovim/nvim-lspconfig',
  dependencies = {
    'williamboman/mason.nvim',
    'saghen/blink.cmp'
  },
  commit = "83a5d191780d7a47916c16e37c2ed29bf7f7c637",
  opts = {
    servers = {
      lua_ls = {
        settings = {
          Lua = {
            diagnostics = {
              globals = { 'vim' }
            }
          }
        }
      },
      gopls = {
        settings = {
          gopls = {
            analyses = {
              unusedparams = true
            }
          }
        }
      }
    }
  },
  config = function(_, opts)
    local settings = require('apollo.context').settings
    local cfg = settings.lsp

    -- local _border = "rounded"

    -- vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
    --   vim.lsp.handlers.hover, {
    --     border = _border
    --   }
    -- )

    -- vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(
    --   vim.lsp.handlers.signature_help, {
    --     border = _border
    --   }
    -- )
    -- vim.diagnostic.config({
    --   virtual_text = {
    --     prefix = '■ ', -- Could be '●', '▎', 'x', '■', , 
    --   },
    --   float = { border = _border },
    -- })

    local lspconfig = require('lspconfig')

    for server, config in pairs(opts.servers) do
      -- passing config.capabilities to blink.cmp merges with the capabilities in your
      -- `opts[server].capabilities, if you've defined it
      config.capabilities = require('blink.cmp').get_lsp_capabilities(config.capabilities)
      -- config.handlers = handlers

      local gotags = settings.general.go.tags
      if server == 'gopls' and gotags ~= '' then
        local gotags_flag = '-tags=' .. gotags
        config.settings.gopls.buildFlags = { gotags_flag }
        config.settings.gopls.env = {
          GOFLAGS = gotags_flag
        }
      end

      lspconfig[server].setup(config)
    end

    -- Autoformat on save
    vim.api.nvim_create_autocmd('BufWritePre', {
      pattern = '',
      command = 'silent! lua vim.lsp.buf.format()'
    })

    local keymap = vim.api.nvim_set_keymap
    local mapdefaults = { noremap = true }

    -- Mappings
    keymap('n', cfg.mappings.code_action, '<cmd>lua vim.lsp.buf.code_action()<CR>', mapdefaults)
    keymap('n', cfg.mappings.hover_symbol, '<cmd>lua vim.lsp.buf.hover()<CR>', mapdefaults)
    keymap('n', cfg.mappings.goto_declaration, '<cmd>lua vim.lsp.buf.declaration()<CR>', mapdefaults)
    keymap('n', cfg.mappings.rename, '<cmd>lua vim.lsp.buf.rename()<CR>', mapdefaults)
    keymap('n', cfg.mappings.goto_definition, '<cmd>lua vim.lsp.buf.definition()<CR>', mapdefaults)
    keymap('n', cfg.mappings.signature_help, '<cmd>lua vim.lsp.buf.signature_help()<CR>', mapdefaults)
    keymap('n', cfg.mappings.references, '<cmd>lua vim.lsp.buf.references()<CR>', mapdefaults)
    keymap('n', cfg.mappings.goto_implementation, '<cmd>lua vim.lsp.buf.implementation()<CR>', mapdefaults)
    keymap('n', cfg.mappings.show_symbol_diagnostic, '<cmd>lua vim.diagnostic.open_float(nil, {focus=false})<CR>',
      mapdefaults)
    keymap('n', cfg.mappings.next_diagnostic, '<cmd>lua vim.diagnostic.goto_next()<CR>', mapdefaults)
    keymap('n', cfg.mappings.prev_diagnostic, '<cmd>lua vim.diagnostic.goto_prev()<CR>', mapdefaults)
  end
}
