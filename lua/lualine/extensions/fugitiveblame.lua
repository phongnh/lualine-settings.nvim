local M = {}

M.sections = {
  lualine_a = {
    function()
      return "FugitiveBlame"
    end,
  },
  lualine_z = { "location" },
}

M.filetypes = { "fugitiveblame" }

return M
