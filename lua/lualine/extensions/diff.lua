local M = {}

M.sections = {
  lualine_a = {
    function()
      return "Diff"
    end,
  },
  lualine_b = {
    function()
      if vim.t.diffpanel ~= nil then
        return vim.fn["lualine_settings#undotree#DiffStatus"]()
      end
      return ""
    end,
  },
}

M.filetypes = { "diff" }

return M
