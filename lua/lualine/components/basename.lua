local lualine_require = require("lualine_require")
local M = lualine_require.require("lualine.component"):extend()

function M:init(options)
  M.super.init(self, options)
end

function M:update_status()
  return vim.fs.basename(vim.api.nvim_buf_get_name(0))
end

return M
