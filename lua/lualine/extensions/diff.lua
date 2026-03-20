local M = {}

M.sections = {
  lualine_a = {
    function()
      return "Diff"
    end,
  },
  lualine_b = {
    "lualine_settings#undotree#DiffStatus",
  },
}

M.filetypes = { "diff" }

return M
