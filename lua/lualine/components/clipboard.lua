local lualine_require = require("lualine_require")
local M = lualine_require.require("lualine.component"):extend()

local default_options = {
  cond = function()
    return string.find(vim.o.clipboard or "", "unnamed") ~= nil
  end,
}

function M:init(options)
  M.super.init(self, options)
  self.options = vim.tbl_deep_extend("keep", self.options or {}, default_options)
end

function M:update_status()
  -- return vim.g.lualine_symbols.clipboard
  return "🅒 "
end

return M
