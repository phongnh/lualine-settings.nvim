-- Use name as mode for known file types
local M = {}

local filetypes = {
  -- https://github.com/jlanzarotta/bufexplorer
  bufexplorer = "BufExplorer",
  snacks_picker_input = "SnacksPickerInput",
  snacks_picker_list = "SnacksPickerList",
  startify = "Startify",
}

local function filetype_mode()
  local ft = vim.bo.filetype ~= "" and vim.bo.filetype or vim.bo.buftype
  return filetypes[ft] or vim.fn.bufname("%")
end

M.sections = {
  lualine_a = {
    "filetype_mode",
  },
  lualine_z = {
    {
      "location",
      cond = function()
        return vim.api.nvim_win_get_width(0) >= 100
      end,
    },
  },
}

M.filetypes = vim.tbl_keys(filetypes)

return M
