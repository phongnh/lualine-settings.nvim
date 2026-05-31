-- Use name as mode for known file types
local M = {}

local filetypes = {
  -- https://github.com/jlanzarotta/bufexplorer
  bufexplorer = "BufExplorer",
  -- https://github.com/tpope/vim-fugitive
  fugitiveblame = "Git Blame",
  startify = "Startify",
  -- vim.cmd.packadd("nvim.undotree")
  ["nvim-undotree"] = "NvimUndotree",
  -- help: vim.pack
  ["nvim-pack"] = "NvimPack",
  -- help :checkhealth
  checkhealth = "Healthchecks",
  -- help ui2
  pager = "Pager",
}

local function filetype_mode()
  local ft = vim.bo.filetype ~= "" and vim.bo.filetype or vim.bo.buftype
  return filetypes[ft] or vim.fn.bufname("%")
end

M.sections = {
  lualine_a = {
    filetype_mode,
  },
  lualine_y = { "position" },
}

M.filetypes = vim.tbl_keys(filetypes)

return M
