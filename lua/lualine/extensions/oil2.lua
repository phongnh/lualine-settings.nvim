-- https://github.com/stevearc/oil.nvim
local M = {}

M.sections = {
  lualine_a = {
    function()
      return "Oil"
    end,
  },
  lualine_c = {
    function()
      local ok, oil = pcall(require, "oil")
      if ok then
        return vim.fn.fnamemodify(oil.get_current_dir(), ":p:~:.:h")
      end
      return ""
    end,
  },
}

M.filetypes = { "oil" }

return M
