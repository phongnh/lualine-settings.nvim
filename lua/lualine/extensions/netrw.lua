local M = {}

M.sections = {
  lualine_a = {
    function()
      return "Netrw"
    end,
  },
  lualine_b = {
    {
      "b:netrw_curdir",
      fmt = function(name, _context)
        return vim.fn.fnamemodify(name, ":p:~:.:h")
      end,
    },
  },
  lualine_y = {
    {
      function()
        return vim.g.netrw_sort_direction or "n"
      end,
      fmt = function(name, _context)
        return (name == "normal" or name == "n") and "[+]" or "[-]"
      end,
    },
  },
  lualine_z = {
    "g:netrw_sort_by",
  },
}

M.filetypes = { "netrw" }

return M
