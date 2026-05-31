-- https://github.com/hedyhli/outline.nvim
local M = {}

M.sections = {
  lualine_a = {
    function()
      return "Outline"
    end,
  },
  lualine_c = {
    {
      function()
        local sidebar = require("outline")._get_sidebar()
        if sidebar then
          local bufname = vim.api.nvim_buf_get_name(sidebar.code.buf or 0)
          return vim.fn.fnamemodify(bufname, ":p:~:.")
        end
        return ""
      end,
    },
  },
  lualine_y = { "position" },
}

M.filetypes = { "Outline" }

return M
