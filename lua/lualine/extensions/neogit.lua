-- https://github.com/NeogitOrg/neogit
local M = {}

local function get_repo()
  local ok, git = pcall(require, "neogit.lib.git")
  if ok then return git.repo end
  return nil
end

local function get_branch()
  local repo = get_repo()
  if repo then
    local head = repo.state and repo.state.head
    if head then
      if head.detached and head.abbrev then
        return head.abbrev
      elseif head.branch then
        return head.branch
      end
    end
  end
  return ""
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
    function() return "Neogit" end,
  },
  lualine_b = {
    {
      get_branch,
      icon = LualineSettings.symbols.branch,
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
