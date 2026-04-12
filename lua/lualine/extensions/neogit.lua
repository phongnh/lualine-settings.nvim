-- https://github.com/NeogitOrg/neogit
local M = {}

local function get_repo()
  local ok, git = pcall(require, "neogit.lib.git")
  if ok then return git.repo end
  return nil
end

local function get_title()
  local repo = get_repo()
  if repo then
    local head = repo.state and repo.state.head
    if head then
      if head.detached and head.abbrev then
        return "Neogit (" .. head.abbrev .. ")"
      elseif head.branch then
        return "Neogit (" .. head.branch .. ")"
      end
    end
  end
  return "Neogit"
end

local function get_cwd()
  local repo = get_repo()
  if repo and repo.worktree_root and repo.worktree_root ~= "" then
    return vim.fn.fnamemodify(repo.worktree_root, ":~")
  end
  return vim.fn.fnamemodify(vim.uv.cwd() or "", ":~")
end

M.sections = {
  lualine_a = {
    {
      get_title,
      icon = LualineSettings.symbols.branch,
    },
  },
  lualine_b = {},
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
  "NeogitStatus",
  "NeogitLogView",
  "NeogitRefsView",
  "NeogitReflogView",
  "NeogitDiffView",
  "NeogitCommitView",
  "NeogitCommitSelectView",
  "NeogitStashView",
  "NeogitPopup",
  "NeogitConsole",
  "NeogitGitCommandHistory",
}

return M
