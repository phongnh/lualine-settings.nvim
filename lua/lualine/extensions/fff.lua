-- https://github.com/dmtrKovalenko/fff.nvim
local M = {}

local function get_state()
  local ok, picker_ui = pcall(require, "fff.picker_ui")
  if ok and picker_ui.state and picker_ui.state.active then
    return picker_ui.state
  end
  return nil
end

local function get_title()
  local state = get_state()
  if state then
    return (state.config and state.config.title) or (state.mode == "grep" and "Live Grep" or "Files")
  end
  return "Files"
end

local function get_cwd()
  local ok, conf = pcall(require, "fff.conf")
  if ok then
    local cfg = conf.get()
    if cfg and cfg.base_path and cfg.base_path ~= "" then
      return vim.fn.fnamemodify(cfg.base_path, ":~")
    end
  end
  return vim.fn.fnamemodify(vim.uv.cwd() or "", ":~")
end

M.sections = {
  lualine_a = {
    function() return "FFF" end,
  },
  lualine_b = {
    {
      get_title,
      icon = LualineSettings.symbols.search,
    },
  },
  lualine_c = {
    {
      get_cwd,
      icon = LualineSettings.symbols.folder,
      cond = function()
        local state = get_state()
        return state ~= nil and state.mode ~= "grep"
      end,
    },
  },
  lualine_x = {},
  lualine_y = {},
  lualine_z = {},
}

M.filetypes = { "fff_input", "fff_list" }

return M
