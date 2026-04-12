-- https://github.com/sindrets/diffview.nvim
local M = {}

local function get_view()
  local ok, lib = pcall(require, "diffview.lib")
  if ok then return lib.get_current_view() end
  return nil
end

local function is_file_history()
  local view = get_view()
  if view then
    return view.class and view.class.name == "FileHistoryView"
  end
  return false
end

local function get_title()
  if is_file_history() then
    return "File History"
  end
  return "Diffview"
end

local function get_rev()
  local view = get_view()
  if view then
    if view.rev_arg and view.rev_arg ~= "" then
      return view.rev_arg
    end
    local ok, result = pcall(function()
      return view.adapter:rev_to_pretty_string(view.left, view.right)
    end)
    if ok and result then
      return result
    end
  end
  return ""
end

local function get_cwd()
  local view = get_view()
  if view and view.adapter and view.adapter.ctx and view.adapter.ctx.toplevel then
    local toplevel = view.adapter.ctx.toplevel
    if toplevel ~= "" then
      return vim.fn.fnamemodify(toplevel, ":~")
    end
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
  "DiffviewFiles",
  "DiffviewFileHistory",
}

return M
