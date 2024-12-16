local M = {}

M.sections = {
  lualine_a = {
    function()
      return "Oil"
    end,
  },
  lualine_b = {
    function()
      local ok, oil = pcall(require, "oil")
      if ok then
        return vim.fn.fnamemodify(oil.get_current_dir(), ":p:~:.:h")
      else
        return ""
      end
    end,
  },
}

M.filetypes = { "oil" }

return M
