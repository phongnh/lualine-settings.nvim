local lualine_require = require("lualine_require")
local M = lualine_require.require("lualine.component"):extend()

local default_filetype_modes = {
  bufexplorer = "BufExplorer",
  cmdline = "Command Line",
  netrw = "Netrw",
  nerdtree = "NERDTree",
  fern = "Fern",
  ["neo-tree"] = "NeoTree",
  ["carbon.explorer"] = "Carbon",
  oil = "Oil",
  NvimTree = "NvimTree",
  undotree = "Undo",
  diff = "Diff",
  startify = "Startify",
  alpha = "Alpha",
  dashboard = "Dashboard",
  ministarter = "Starter",
  tagbar = "Tagbar",
  terminal = "TERMINAL",
  help = "HELP",
  qf = "Quickfix",
  git = "git",
  gitcommit = "Commit Message",
  gitrebase = "Git Rebase",
  fugitive = "Fugitive",
  fugitiveblame = "Git Blame",
  GV = "GV",
  snacks_picker_input = "SnacksPickerInput",
  snacks_picker_list = "SnacksPickerList",
}

local default_options = {
  filetype_modes = {},
}

function M:init(options)
  M.super.init(self, options)
  self.options = vim.tbl_deep_extend("keep", self.options or {}, default_options)
  self.options.filetype_modes = vim.tbl_deep_extend("keep", self.options.filetype_modes or {}, default_filetype_modes)
end

function M:update_status()
  local ft = vim.bo.filetype ~= "" and vim.bo.filetype or vim.bo.buftype
  return self.options.filetype_modes[ft] or vim.fn.fnamemodify(vim.api.nvim_buf_get_name(0), ":t")
end

return M
