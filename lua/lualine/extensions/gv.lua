local M = {}

M.sections = {
  lualine_a = {
    function()
      return "GV"
    end,
  },
  lualine_b = {
    function()
      return "o: open split"
    end,
    function()
      return "O: open tab"
    end,
    function()
      return "gb: GBrowse"
    end,
    function()
      return "q: quit"
    end,
  },
  lualine_z = { "location" },
}

M.filetypes = { "GV" }

return M
