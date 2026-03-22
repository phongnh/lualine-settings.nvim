-- https://github.com/folke/snacks.nvim
local M = {}

local function get_explorer_cwd()
  local pickers = require("snacks.picker.core.picker").get({
    source = "explorer",
    tab = true,
  })

  local cwd = vim.fn.getcwd()

  if pickers[1] and pickers[1].cwd then
    cwd = pickers[1]:cwd()
  end

  return vim.fn.fnamemodify(cwd, ":~")
end

M.sections = {
  lualine_a = {
    {
      function()
        return "Explorer"
      end,
      icon = LualineSettings.symbols.explorer,
    },
  },
  lualine_c = {
    {
      get_explorer_cwd,
      icon = LualineSettings.symbols.folder,
    },
  },
  lualine_z = {
    { "position" },
  },
}

M.filetypes = { "snacks_picker_list" }

return M
