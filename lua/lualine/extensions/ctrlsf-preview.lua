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
      "ctrlsf#utils#PreviewSectionC",
      fmt = function(name, _context)
        return vim.fn.fnamemodify(name, ":~:.")
      end,
    },
  },
  lualine_z = { "position" },
}

M.filetypes = { "ctrlsf-preview" }

return M
