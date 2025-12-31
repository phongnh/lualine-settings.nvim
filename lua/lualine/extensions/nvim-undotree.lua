-- vim.cmd.packadd("nvim.undotree")
local M = {}

M.sections = {
  lualine_a = {
    function()
      return "NvimUndotree"
    end,
  },
}

M.filetypes = { "nvim-undotree" }

return M
