local M = {}

M.sections = {
  lualine_a = {
    function()
      return "Commit Message"
    end,
    "spell",
  },
  lualine_b = { "branch" },
  lualine_z = { "location" },
}

M.filetypes = { "gitcommit" }

return M
