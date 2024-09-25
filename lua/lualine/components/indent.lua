local lualine_require = require("lualine_require")
local M = lualine_require.require("lualine.component"):extend()

local default_options = {
  is_compact = function()
    return vim.api.nvim_win_get_width(0) < 100
  end,
}

function M:init(options)
  M.super.init(self, options)
  self.options = vim.tbl_deep_extend("keep", self.options or {}, default_options)
end

function M:update_status()
  local shiftwidth = vim.fn.exists("*shiftwidth") == 1 and vim.fn.shiftwidth() or vim.bo.shiftwidth
  if self.options.is_compact ~= nil and self.options.is_compact() then
    return string.format(vim.bo.expandtab and "SPC: %d" or "TAB: %d", shiftwidth)
  else
    return string.format(vim.bo.expandtab and "Spaces: %d" or "Tab Size: %d", shiftwidth)
  end
end

return M
