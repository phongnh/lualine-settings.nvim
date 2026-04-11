-- https://github.com/ibhagwan/fzf-lua
local M = {}

-- fzf-lua cmd names that search within a directory context
local cmds_with_cwd = {
  "files",
  "args",
  "live_grep",
  "live_grep_native",
  "live_grep_resume",
  "live_grep_glob",
  "grep",
  "grep_last",
  "grep_cword",
  "grep_cWORD",
  "grep_visual",
  "grep_project",
  "git_files",
  "git_status",
  "git_diff",
  "git_hunks",
  "tags",
  "tags_live_grep",
  "zoxide",
  "vcs_files",
}

local function get_info()
  local ok, fzf = pcall(require, "fzf-lua")
  if not ok then return nil end
  return fzf.get_info()
end

local function get_title()
  local info = get_info()
  if info and info.cmd then
    return info.cmd:gsub("_", " ")
  end
  return "fzf"
end

local function get_cwd()
  local info = get_info()
  if info then
    local winobj = info.winobj
    if not winobj then
      -- winobj not cached in info yet; try get_info with filter
      local ok, fzf = pcall(require, "fzf-lua")
      if ok then
        info = fzf.get_info({ winobj = true })
        winobj = info and info.winobj
      end
    end
    if winobj and winobj._o and winobj._o.cwd then
      return vim.fn.fnamemodify(winobj._o.cwd, ":~")
    end
  end
  return vim.fn.fnamemodify(vim.uv.cwd() or "", ":~")
end

M.sections = {
  lualine_a = {
    {
      get_title,
      icon = LualineSettings.symbols.search,
    },
  },
  lualine_b = {},
  lualine_c = {
    {
      get_cwd,
      icon = LualineSettings.symbols.folder,
      cond = function()
        local info = get_info()
        return info ~= nil and vim.tbl_contains(cmds_with_cwd, info.cmd)
      end,
    },
  },
  lualine_x = {},
  lualine_y = {},
  lualine_z = {},
}

-- fzf-lua in float mode sets filetype "fzf" on the terminal buffer.
-- The builtin lualine fzf extension also uses "fzf", but we override it here
-- with a richer implementation consistent with telescope/snacks_picker/fff.
M.filetypes = { "fzf" }

return M
