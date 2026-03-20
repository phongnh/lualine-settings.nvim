local lualine_require = require("lualine_require")
local M = lualine_require.require("lualine.component"):extend()

function M:init(options)
  M.super.init(self, options)
  self.options.cond = function()
    return vim.o.spell
  end
end

function M:update_status()
  return string.upper((vim.o.spelllang or ""):gsub(",", "/"))
end

return M
