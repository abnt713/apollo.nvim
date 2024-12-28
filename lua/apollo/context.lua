local dapleader = "\\"

local dapkey = function(combo)
  return dapleader .. combo
end

local settings = {
  colorizer = {
    mappings = {
      colorize = '<leader>cc'
    }
  },
  dap = {
    gotags = '',
    mappings = {
      continue = dapkey('c'),
      open_repl = dapkey('r'),
      breakpoint = dapkey('b'),
      conditional_breakpoint = dapkey('<s-b>'),
      list_breakpoints = dapkey('l'),
      hover_widget = dapkey('h'),
    }
  },
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
  lsp = {
    gopls = {
      tags = ''
    },
    mappings = {
      code_action = 'ga',
      hover_symbol = 'gh',
      goto_declaration = 'gD',
      rename = 'gm',
      goto_definition = 'gd',
      signature_help = 'gs',
      references = 'gr',
      goto_implementation = 'gi',
      show_symbol_diagnostic = 'gl',
      next_diagnostic = 'gn',
      prev_diagnostic = 'gp',
      trouble_project = 'gt',
      trouble_document = 'gT',
    }
  },
  mason = {
    border = 'rounded'
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
