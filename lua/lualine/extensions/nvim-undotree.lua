local M = {}

M.sections = {
  lualine_a = {
    function()
      return "Undotree"
    end,
  },
  lualine_c = {
    function()
      if vim.b.nvim_is_undotree then
      end
    end,
  },
}

M.filetypes = { "nvim-undotree" }

return M
