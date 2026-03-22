-- https://github.com/dyng/ctrlsf.vim
local M = {}

M.sections = {
  lualine_a = {
    function()
      return "CtrlSF"
    end,
  },
  lualine_b = {
    {
      "ctrlsf#utils#SectionB",
      fmt = function(name, _context)
        return name:gsub("Pattern: ", "")
      end,
    },
  },
  lualine_c = {
    {
      "ctrlsf#utils#SectionC",
      fmt = function(name, _context)
        return vim.fn.fnamemodify(name, ":p:~:.")
      end,
    },
  },
  lualine_z = {
    "ctrlsf#utils#SectionX",
  },
}

M.filetypes = { "ctrlsf" }

return M
