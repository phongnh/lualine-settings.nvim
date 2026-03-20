-- https://github.com/tpope/vim-fugitive
local M = {}

M.sections = {
  lualine_a = {
    function()
      return "Git Status"
    end,
  },
  lualine_b = { "gitbranch" },
  lualine_c = {
    {
      function()
        return string.format("Staged: %d", #vim.b.fugitive_status["staged"])
      end,
      cond = function()
        return vim.b.fugitive_status ~= nil and #vim.b.fugitive_status["staged"] > 0
      end,
    },
    {
      function()
        return string.format("Untaged: %d", #vim.b.fugitive_status["unstaged"])
      end,
      cond = function()
        return vim.b.fugitive_status ~= nil and #vim.b.fugitive_status["unstaged"] > 0
      end,
    },
    {
      function()
        return string.format("Untracked: %d", #vim.b.fugitive_status["untracked"])
      end,
      cond = function()
        return vim.b.fugitive_status ~= nil and #vim.b.fugitive_status["untracked"] > 0
      end,
    },
  },
  lualine_z = { "location" },
}

M.filetypes = { "fugitive" }

return M
