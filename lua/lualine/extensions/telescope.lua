-- https://github.com/nvim-lua/telescope.nvim
local M = {}

local pickers_with_cwd = {
  "Find Files",
  "Live Grep",
  "Git Files",
  "Git Status",
}

local function get_picker()
  return require("telescope.actions.state").get_current_picker(vim.api.nvim_get_current_buf())
end

local function get_picker_title()
  local picker = get_picker()
  return picker and picker.prompt_title or "Telescope"
end

local function get_picker_cwd()
  local picker = get_picker()
  if picker and picker.cwd then
    return vim.fn.fnamemodify(picker.cwd, ":~")
  end
  return ""
end

M.sections = {
  lualine_a = {
    function() return "Telescope" end,
  },
  lualine_b = {
    {
      get_picker_title,
      icon = LualineSettings.symbols.search,
    },
  },
  lualine_c = {
    {
      get_picker_cwd,
      icon = LualineSettings.symbols.folder,
      cond = function()
        return vim.tbl_contains(pickers_with_cwd, get_picker_title())
          and get_picker_cwd() ~= ""
      end,
    },
  },
  lualine_x = {},
  lualine_y = {},
  lualine_z = {},
}

M.filetypes = { "TelescopePrompt" }

return M
