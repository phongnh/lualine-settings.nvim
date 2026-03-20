local lualine_require = require("lualine_require")
local M = lualine_require.require("lualine.component"):extend()

function M:init(options)
  M.super.init(self, options)
  self.options.cond = function()
    return vim.api.nvim_win_get_width(0) >= 60
  end
end

function M:update_status()
  local encoding = (not vim.bo.fileencoding or vim.bo.fileencoding == "") and vim.o.encoding or vim.bo.fileencoding
  local status = encoding ~= "utf-8" and (encoding .. " ") or ""
  status = status .. (vim.bo.bomb and (LualineSettings.symbols.bomb .. " ") or "")
  status = status .. (not vim.bo.eol and (LualineSettings.symbols.noeol .. " ") or "")
  if vim.bo.fileformat and vim.bo.fileformat ~= "" and vim.bo.fileformat ~= "unix" then
    status = status .. LualineSettings.symbols[vim.bo.fileformat] .. " "
  end
  return status
end

return M
