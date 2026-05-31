-- https://github.com/tpope/vim-fugitive
local M = {}

local sections = {
  staged = "Staged",
  unstaged = "Unstaged",
  untracked = "Untracked",
}

local fugitive_status = function(section)
  return function()
    if vim.b.fugitive_status ~= nil and #vim.b.fugitive_status[section] > 0 then
      return string.format("%s: %d", sections[section] or section, #vim.b.fugitive_status[section])
    end
    return ""
  end
end

M.sections = {
  lualine_a = {
    function()
      return "Git Status"
    end,
  },
  lualine_b = { "gitbranch" },
  lualine_c = {
    {
      fugitive_status("staged"),
    },
    {
      fugitive_status("unstaged"),
    },
    {
      fugitive_status("untracked"),
    },
  },
  lualine_y = { "position" },
}

M.filetypes = { "fugitive" }

return M
