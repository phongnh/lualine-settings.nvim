-- https://github.com/folke/snacks.nvim
local M = {}

local pickers_with_cwd = {
  "Files",
  "Recent",
  "Git Files",
  "Grep",
  "Grep Word",
}

local function get_picker()
  local pickers = require("snacks.picker.core.picker").get({ tab = true })
  return pickers[1]
end

local function get_picker_title()
  local picker = get_picker()
  if picker then
    return picker.title or picker.opts.source or "Picker"
  end
  return "Picker"
end

local function get_picker_cwd()
  local picker = get_picker()
  if picker and picker.cwd then
    return vim.fn.fnamemodify(picker:cwd(), ":~")
  end
  return ""
end

M.sections = {
  lualine_a = {
    {
      get_picker_title,
      icon = LualineSettings.symbols.search,
    },
  },
  lualine_b = {},
  lualine_c = {
    {
      get_picker_cwd,
      icon = LualineSettings.symbols.folder,
      cond = function()
        return vim.tbl_contains(pickers_with_cwd, get_picker_title())
      end,
    },
  },
  lualine_x = {},
  lualine_y = {},
  lualine_z = {},
}

M.filetypes = { "snacks_picker_input" }

return M
