local M = {}

M.sections = {
  lualine_a = {
    function()
      return "Command Line"
    end,
  },
  lualine_b = {
    function()
      return "<C-C>: edit"
    end,
    function()
      return "<CR>: execute"
    end,
  },
  lualine_z = { "location" },
}

M.filetypes = { "cmdline" }

return M
