local M = {}

M.sections = {
  lualine_a = {
    function()
      return "Commit Message"
    end,
    function()
      return string.upper((vim.o.spelllang or ""):gsub(",", "/"))
    end,
  },
  lualine_b = { "branch" },
  lualine_z = { "location" },
}

M.filetypes = { "gitcommit" }

return M
