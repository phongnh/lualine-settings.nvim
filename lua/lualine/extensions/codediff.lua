-- https://github.com/esmuellert/codediff.nvim
local M = {}

local function get_session()
  local ok, accessors = pcall(require, "codediff.ui.lifecycle.accessors")
  if ok then
    local tabpage = vim.api.nvim_get_current_tabpage()
    return accessors.get_session(tabpage)
  end
  return nil
end

local function get_title()
  local ft = vim.bo.filetype
  if ft == "codediff-history" then
    return "File History"
  end
  return "CodeDiff"
end

local function get_rev()
  local sess = get_session()
  if not sess then
    return ""
  end
  local rev = sess.original_revision
  if rev and rev ~= "" and rev ~= "WORKING" then
    return rev
  end
  return ""
end

local function get_cwd()
  local sess = get_session()
  if sess and sess.git_root and sess.git_root ~= "" then
    return vim.fn.fnamemodify(sess.git_root, ":~")
  end
  return vim.fn.fnamemodify(vim.uv.cwd() or "", ":~")
end

M.sections = {
  lualine_a = {
    get_title,
  },
  lualine_b = {
    {
      get_rev,
      icon = LualineSettings.symbols.branch,
      cond = function()
        return get_rev() ~= ""
      end,
    },
  },
  lualine_c = {
    {
      get_cwd,
      icon = LualineSettings.symbols.folder,
    },
  },
  lualine_x = {},
  lualine_y = {},
  lualine_z = {},
}

M.filetypes = {
  "codediff-explorer",
  "codediff-history",
}

return M
