-- https://github.com/Yggdroot/LeaderF
local M = {}

M.sections = {
  lualine_a = {
    function()
      return "LeaderF"
    end,
  },
  lualine_b = { "b:Lf_category" },
}

M.filetypes = { "leaderf" }

return M
