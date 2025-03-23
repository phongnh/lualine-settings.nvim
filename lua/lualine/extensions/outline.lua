-- https://github.com/hedyhli/outline.nvim
local M = {}

M.sections = {
  lualine_a = {
    function()
      return "Outline"
    end,
  },
  lualine_b = {
    {
      function()
        local sidebar = require("outline")._get_sidebar()
        if not sidebar then
          return ""
        end
        local buf = sidebar.code.buf
        return vim.api.nvim_buf_get_name(buf)
      end,
      fmt = function(name, _context)
        return vim.fn.fnamemodify(name, ":p:~:.")
      end,
    },
  },
}

M.filetypes = { "Outline" }

return M
