local M = {}

M.sections = {
  lualine_a = {
    function()
      return "Netrw"
    end,
  },
  lualine_c = {
    {
      "b:netrw_curdir",
      fmt = function(name, _context)
        return vim.fn.fnamemodify(name, ":p:~:.:h")
      end,
    },
  },
  lualine_y = {
    function()
      local direction = (vim.g.netrw_sort_direction or "n")
      return vim.g.netrw_sort_by .. ":" .. ((direction == "normal" or direction == "n") and "+" or "-")
    end,
  },
}

M.filetypes = { "netrw" }

return M
