local lualine_require = require("lualine_require")
local M = lualine_require.require("lualine.component"):extend()

function M:init(options)
  M.super.init(self, options)
  self.options.is_compact = function()
    return vim.api.nvim_win_get_width(0) < 100
  end
end

function M:update_status()
  local is_compact = self.options.is_compact()
  if vim.bo.expandtab then
    local shiftwidth = vim.fn.exists("*shiftwidth") == 1 and vim.fn.shiftwidth() or vim.bo.shiftwidth
    return string.format(is_compact and "SPC: %d" or "Spaces: %d", shiftwidth)
  else
    return string.format(is_compact and "TAB: %d" or "Tab Size: %d", vim.bo.tabstop)
  end
end

return M
