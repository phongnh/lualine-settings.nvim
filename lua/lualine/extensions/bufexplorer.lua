-- https://github.com/jlanzarotta/bufexplorer
local M = {}

M.sections = {
  lualine_a = {
    function()
      return "BufExplorer"
    end,
  },
}

M.filetypes = { "BufExplorer" }

return M
