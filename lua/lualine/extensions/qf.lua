-- Cloned from https://github.com/nvim-lualine/lualine.nvim/blob/master/lua/lualine/extensions/quickfix.lua
local function is_loclist()
  return vim.fn.getloclist(0, { filewinid = 1 }).filewinid ~= 0
end

local function label()
  return is_loclist() and "Location" or "Quickfix"
end

local function title()
  if is_loclist() then
    return vim.fn.getloclist(0, { title = 0 }).title
  end
  return vim.fn.getqflist({ title = 0 }).title
end

local M = {}

function M.init()
  -- Disable Vim Quickfix's statusline
  vim.g.qf_disable_statusline = true
end

M.sections = {
  lualine_a = { label },
  lualine_b = { title },
  lualine_z = { "location" },
}

M.filetypes = { "qf" }

return M
