-- https://github.com/mbbill/undotree
local M = {}

M.sections = {
  lualine_a = {
    function()
      return "Undo"
    end,
  },
  lualine_b = {
    "lualine_settings#undotree#Status",
  },
}

M.filetypes = { "undotree" }

return M
