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
      function()
        return vim.fn["ctrlsf#utils#SectionB"]()
      end,
      fmt = function(name, _context)
          return name:gsub("Pattern: ", "")
      end,
    },
    {
      function()
        return vim.fn["ctrlsf#utils#SectionC"]()
      end,
      fmt = function(name, _context)
        return vim.fn.fnamemodify(name, ":p:~:.")
      end
    },
  },
  lualine_z = {
    function()
      return vim.fn["ctrlsf#utils#SectionX"]()
    end,
  },
}

M.filetypes = { "ctrlsf" }

return M
