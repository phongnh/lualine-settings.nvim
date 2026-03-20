-- https://github.com/mbbill/undotree
local M = {}

M.sections = {
  lualine_a = {
    function()
      return "Undo"
    end,
  },
  lualine_b = {
    function()
      if vim.t.undotree ~= nil then
        return vim.fn["t:undotree.GetStatusLine"]()
      end
      return ""
    end,
  },
}

M.filetypes = { "undotree" }

return M
