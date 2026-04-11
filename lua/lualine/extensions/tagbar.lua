-- https://github.com/preservim/tagbar
local M = {}

local function tagbar()
  return vim.g.lualine_tagbar or {}
end

M.sections = {
  lualine_a = {
    function()
      return tagbar().sort or ""
    end,
  },
  lualine_b = {
    {
      function()
        return table.concat(tagbar().flags or {}, "")
      end,
      cond = function()
        local flags = tagbar().flags
        return flags ~= nil and not vim.tbl_isempty(flags)
      end,
      fmt = function(name, _context)
        return string.format("[%s]", name)
      end,
    },
  },
  lualine_c = {
    function()
      return tagbar().fname or ""
    end,
  },
}

M.filetypes = { "tagbar" }

return M
