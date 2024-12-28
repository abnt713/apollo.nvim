local cfg = require('apollo.context').settings.mason

return {
  "williamboman/mason.nvim",
  build = ':MasonUpdate',
  opts = {
    ui = {
      border = cfg.border
    }
  }
}
