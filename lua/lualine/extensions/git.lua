local M = {}

M.sections = {
  lualine_a = {
    function()
      return "Git"
    end,
  },
  lualine_b = { "basename" },
  lualine_z = { "position" },
}

M.filetypes = { "git" }

return M
