local cfg = require('apollo.context').settings.dap

local function go_adapter()
  local gotags_flag = '-tags=' .. cfg.gotags
  return {
    {
      type = 'delve',
      name = "Debug",
      request = "launch",
      program = "${file}",
      buildFlags = gotags_flag,
    },
    {
      type = 'delve',
      name = "Debug Package",
      request = "launch",
      program = "${fileDirname}",
      buildFlags = gotags_flag,
    },
    {
      type = 'delve',
      name = "Attach",
      mode = "local",
      request = "attach",
      processId = require("dap.utils").pick_process,
      buildFlags = gotags_flag,
    },
    {
      type = 'delve',
      name = "Debug test",
      request = "launch",
      mode = "test",
      program = "${file}",
      buildFlags = gotags_flag,
    },
    {
      type = 'delve',
      name = "Debug test (go.mod)",
      request = "launch",
      mode = "test",
      program = "./${relativeFileDirname}",
      buildFlags = gotags_flag,
    },
    -- {
    --   type = 'delve',
    --   name = "Debug closest test (go.mod)",
    --   request = "launch",
    --   mode = "test",
    --   args = get_arguments,
    --   program = "./${relativeFileDirname}",
    --   buildFlags = gotags_flag,
    -- },
  }
end

return {
  "mfussenegger/nvim-dap",
  dependencies = {
    'williamboman/mason.nvim',
    'jayp0521/mason-nvim-dap.nvim'
  },
  config = function()
    local dap = require('dap')
    dap.configurations.go = go_adapter()
    dap.adapters.delve = {
      type = "server",
      port = "${port}",
      executable = {
        command = "dlv",
        args = { "dap", "-l", "127.0.0.1:${port}" },
      },
      options = {
        initialize_timeout_sec = 20,
      },
    }

    require("mason-nvim-dap").setup({ automatic_installation = true })

    local keymap = vim.api.nvim_set_keymap
    local mapdefaults = { noremap = true }
    keymap("n", cfg.mappings.continue, "<cmd>lua require('dap').continue()<CR>", mapdefaults)
    keymap("n", cfg.mappings.open_repl, "<cmd>lua require('dap').repl.toggle()<CR>", mapdefaults)
    keymap("n", cfg.mappings.breakpoint, "<cmd>lua require('dap').toggle_breakpoint()<CR>", mapdefaults)
    keymap("n", cfg.mappings.conditional_breakpoint,
      "<cmd>lua require('dap').set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>", mapdefaults)
    keymap("n", cfg.mappings.list_breakpoints, "<cmd>lua require('dap').list_breakpoints(true)<CR>", mapdefaults)
    keymap('n', cfg.mappings.hover_widget, "<cmd>lua require('dap.ui.widgets').hover()<CR>", mapdefaults)
  end
}
