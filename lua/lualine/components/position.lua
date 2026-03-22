local lualine_require = require("lualine_require")
local M = lualine_require.require("lualine.component"):extend()

function M:init(options)
  M.super.init(self, options)
  self.options.cond = function()
    return vim.api.nvim_win_get_width(0) >= 100
  end
end

function M:update_status()
  local line = vim.fn.line(".")
  local col = vim.fn.charcol(".")
  return string.format("%3d:%-3d", line, col)
end

return M
