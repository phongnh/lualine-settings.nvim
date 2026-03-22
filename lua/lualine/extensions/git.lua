local M = {}

M.sections = {
  lualine_a = {
    function()
      return "Git"
    end,
  },
  lualine_c = { "basename" },
  lualine_z = { "position" },
}

M.filetypes = { "git" }

return M
