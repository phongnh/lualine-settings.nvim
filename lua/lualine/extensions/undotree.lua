local M = {}

M.sections = {
  lualine_a = {
    function()
      return "Undo"
    end,
  },
  lualine_b = {
    function()
      return vim.fn["lualine_settings#undotree#Status"]()
    end,
  },
}

M.filetypes = { "undotree" }

return M
