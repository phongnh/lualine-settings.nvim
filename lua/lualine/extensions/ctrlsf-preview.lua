-- https://github.com/dyng/ctrlsf.vim
local M = {}

M.sections = {
  lualine_a = {
    function()
      return "Preview"
    end,
  },
  lualine_b = {
    {
      function()
        return vim.fn["ctrlsf#utils#PreviewSectionC"]()
      end,
      fmt = function(name, _context)
        return vim.fn.fnamemodify(name, ":~:.")
      end,
    },
  },
  lualine_z = { "location" },
}

M.filetypes = { "ctrlsf-preview" }

return M
