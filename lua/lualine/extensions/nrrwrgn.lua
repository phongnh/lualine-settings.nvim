-- https://github.com/chrisbra/NrrwRgn
local M = {}

local visual_modes = {
  [""] = "",
  v = " [C]",
  V = "",
  [""] = " [B]",
}

local function mode()
  local name = vim.b.nrrw_instn ~= nil and string.format("NrrwRgn#%d", vim.b.nrrw_instn) or "NrrwRgn"
  local prefix = vim.startswith(vim.fn.bufname("%"), "NrrwRgn_multi") and "Multi" or ""

  local status = vim.fn["nrrwrgn#NrrwRgnStatus"]()
  if vim.tbl_isempty(status) then
    return prefix .. name
  end
  prefix = status.multi == 1 and "Multi" or ""
  local visual = visual_modes[status.visual or "V"]
  return prefix .. name .. visual
end

local function line_range()
  local status = vim.fn["nrrwrgn#NrrwRgnStatus"]()
  if status.multi ~= 1 then
    return string.format("[%d-%d]", status.start[2], status["end"][2])
  end
  return ""
end

local function bufname()
  local status = vim.fn["nrrwrgn#NrrwRgnStatus"]()
  local bufname = status.fullname ~= nil and status.fullname or vim.api.nvim_buf_get_name(vim.b.orig_buf or 0)
  return vim.fn.fnamemodify(bufname, ":~:.")
end

M.sections = {
  lualine_a = {
    mode,
  },
  lualine_b = {
    line_range,
  },
  lualine_c = {
    bufname,
  },
  lualine_z = { "location" },
}

M.filetypes = { "NrrwRgn" }

return M
