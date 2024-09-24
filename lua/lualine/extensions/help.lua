local M = {}

M.sections = {
  lualine_a = {
    function()
      return "HELP"
    end,
  },
  lualine_c = {
    function()
      return vim.api.nvim_buf_get_name(0)
    end,
  },
  lualine_z = { "location" },
}

M.filetypes = { "help" }

return M
