local lualine_require = require("lualine_require")
local M = lualine_require.require("lualine.component"):extend()

function M:init(options)
  M.super.init(self, options)
  self.options.cond = function()
    return string.find(vim.o.clipboard or "", "unnamed") ~= nil
  end
end

function M:update_status()
  return LualineSettings.symbols.clipboard
end

return M
