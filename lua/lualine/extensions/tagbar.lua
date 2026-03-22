-- https://github.com/preservim/tagbar
local M = {}

M.sections = {
  lualine_a = { "g:lualine_tagbar.sort" },
  lualine_b = {
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
  lualine_c = { "g:lualine_tagbar.fname" },
}

M.filetypes = { "tagbar" }

return M
