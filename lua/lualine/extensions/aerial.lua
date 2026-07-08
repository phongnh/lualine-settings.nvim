local M = {}

M.sections = {
  lualine_a = {
    function()
      return "Aerial"
    end,
  },
  lualine_b = {
    {
      "aerial",
      sep = " ",
      sep_icon = "",
      depth = 5,
      dense = false,
      dense_sep = ".",
      colored = true,
    },
  },
  lualine_z = { "location" },
}

M.filetypes = { "aerial" }

return M
