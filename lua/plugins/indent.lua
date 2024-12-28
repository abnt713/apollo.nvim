return {
  "lukas-reineke/indent-blankline.nvim",
  main = 'ibl',
  opts = {
    indent = {
      char = '¦',
    },
    scope = {
      enabled = false,
    },
    exclude = {
      buftypes = {
        'terminal',
        'checkhealth',
        'help',
        'lspinfo',
        'packer',
        'startup',
      },
      filetypes = {
        'lazy',
        'mason',
      }
    },
  }
}
