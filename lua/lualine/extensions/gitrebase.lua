local M = {}

M.sections = {
  lualine_a = {
    function()
      return "Git Rebase"
    end,
    "spell",
  },
  lualine_b = { "branch" },
  lualine_z = { "location" },
}

M.filetypes = { "gitrebase" }

return M
