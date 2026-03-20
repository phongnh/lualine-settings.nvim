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
      if vim.fn.exists("t:undotree") == 1 then
        return vim.fn["t:undotree.GetStatusLine"]()
      end
      return ""
    end,
  },
}

M.filetypes = { "undotree" }

return M
