local M = {}

M.sections = {
  lualine_a = {
    function()
      return "Git Rebase"
    end,
  },
  lualine_b = { "branch" },
  lualine_x = { "spell" },
  lualine_z = { "position" },
}

M.filetypes = { "gitrebase" }

return M
