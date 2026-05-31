local M = {}

M.sections = {
  lualine_a = {
    function()
      return "Commit Message"
    end,
  },
  lualine_b = { "branch" },
  lualine_x = { "spell" },
  lualine_y = { "position" },
}

M.filetypes = { "gitcommit" }

return M
