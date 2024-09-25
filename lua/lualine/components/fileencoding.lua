local lualine_require = require("lualine_require")
local M = lualine_require.require("lualine.component"):extend()

local default_options = {
  cond = function()
    return vim.api.nvim_win_get_width(0) >= 60
  end,
}

function M:init(options)
  M.super.init(self, options)
  self.options = vim.tbl_deep_extend("keep", self.options or {}, default_options)
end

function M:update_status()
  local encoding = (vim.bo.fileencoding or ""):len() > 0 and vim.bo.fileencoding or vim.o.encoding
  encoding = (encoding == "utf-8") and "" or (encoding .. " ")
  local bomb = vim.bo.bomb and LualineSettings.symbols.bomb .. " " or ""
  local noeol = vim.bo.eol and "" or LualineSettings.symbols.noeol .. " "
  local format = LualineSettings.symbols[vim.bo.fileformat] or "[empty]"
  format = format == "[unix]" and "" or format .. " "
  return encoding .. bomb .. noeol .. format
end

return M
