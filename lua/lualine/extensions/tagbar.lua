-- https://github.com/preservim/tagbar
local M = {}

M.sections = {
  lualine_a = { "g:lualine_tagbar.sort" },
  lualine_b = {
    {
      "g:lualine_tagbar.fname",
    },
    {
      function()
          return table.concat(vim.g.lualine_tagbar.flags, "")
      end,
      cond = function()
        return not vim.tbl_isempty(vim.g.lualine_tagbar.flags)
      end,
      fmt = function(name, _context)
        return string.format("[%s]", name)
      end,
    },
  },
}

M.filetypes = { "tagbar" }

return M
