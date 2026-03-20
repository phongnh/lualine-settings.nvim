local M = {}

M.sections = {
  lualine_a = {
    function()
      return "Git"
    end,
  },
  lualine_b = { "basename" },
  lualine_z = { "location" },
}

M.filetypes = { "git" }

return M
