local lualine_require = require("lualine_require")
local M = lualine_require.require("lualine.component"):extend()

function M:init(options)
  M.super.init(self, options)
end

function M:update_status()
  return LualineSettings.symbols.branch .. " " .. vim.fn.FugitiveHead()
end

return M
