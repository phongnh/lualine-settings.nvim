local M = {}

-- stylua: ignore start
local section_separator_styles = {
  default  = { left = "", right = "" },
  angle    = { left = "", right = "" },
  curvy    = { left = "", right = "" },
  slant    = { left = "", right = "" },
  ["><"]   = { left = "", right = "" },
  [">("]   = { left = "", right = "" },
  [">\\"]  = { left = "", right = "" },
  [">/"]   = { left = "", right = "" },
  [")("]   = { left = "", right = "" },
  [")<"]   = { left = "", right = "" },
  [")\\"]  = { left = "", right = "" },
  [")/"]   = { left = "", right = "" },
  ["\\\\"] = { left = "", right = "" },
  ["\\/"]  = { left = "", right = "" },
  ["\\<"]  = { left = "", right = "" },
  ["\\("]  = { left = "", right = "" },
  ["//"]   = { left = "", right = "" },
  ["/\\"]  = { left = "", right = "" },
  ["/<"]   = { left = "", right = "" },
  ["/("]   = { left = "", right = "" },
  ["||"]   = { left = "",  right = ""  },
}
-- stylua: ignore end

-- stylua: ignore start
local component_separator_styles = {
  default  = { left = "", right = "" },
  angle    = { left = "", right = "" },
  curvy    = { left = "", right = "" },
  slant    = { left = "", right = "" },
  ["><"]   = { left = "", right = "" },
  [">("]   = { left = "", right = "" },
  [">\\"]  = { left = "", right = "" },
  [">/"]   = { left = "", right = "" },
  [")("]   = { left = "", right = "" },
  [")<"]   = { left = "", right = "" },
  [")\\"]  = { left = "", right = "" },
  [")/"]   = { left = "", right = "" },
  ["\\\\"] = { left = "", right = "" },
  ["\\/"]  = { left = "", right = "" },
  ["\\<"]  = { left = "", right = "" },
  ["\\("]  = { left = "", right = "" },
  ["//"]   = { left = "", right = "" },
  ["/\\"]  = { left = "", right = "" },
  ["/<"]   = { left = "", right = "" },
  ["/("]   = { left = "", right = "" },
  ["||"]   = { left = "|", right = "|" },
}
-- stylua: ignore end

local default_symbols = {
  dos = "dos",
  mac = "mac",
  unix = "unix",
  tabs = "TABS",
  space = " ",
  bomb = "🅑 ",
  noeol = "∉ ",
  clipboard = "🅒 ",
  paste = "🅟 ",
  readonly = "",
  linenr = "☰",
  branch = "⎇ ",
  ellipsis = "…",
}

local devicons_symbols = {
  dos = "",
  mac = "",
  unix = "",
  tabs = " ",
  space = " ",
  bomb = " ",
  noeol = " ",
  clipboard = "🅒 ",
  paste = "🅟 ",
  readonly = "",
  linenr = "",
  branch = "",
  ellipsis = "…",
}

local get_section_separators = function(style)
  return section_separator_styles[style] or section_separator_styles["||"]
end

local get_component_separators = function(style)
  return component_separator_styles[style] or component_separator_styles["||"]
end

local H = {}

H.default_config = {
  show_devicons = false,
  powerline_style = "||",
  show_git_branch = true,
  show_linenr = false,
}

H.setup_config = function(config)
  vim.validate({ config = { config, "table", true } })
  config = vim.tbl_deep_extend("force", vim.deepcopy(H.default_config), config or {})

  vim.validate({
    show_devicons = { config.show_devicons, "boolean" },
    powerline_style = { config.powerline_style, "string" },
    symbols = { config.symbols, "table", true },
    show_git_branch = { config.show_git_branch, "boolean" },
    show_linenr = { config.show_linenr, "boolean" },
  })

  return config
end

H.apply_config = function(config)
  LualineSettings.config = config

  if config.show_devicons then
    LualineSettings.symbols = vim.deepcopy(devicons_symbols)
  else
    LualineSettings.symbols = vim.deepcopy(default_symbols)
  end
  LualineSettings.symbols = vim.tbl_deep_extend("force", LualineSettings.symbols, config.symbols or {})

  config.powerline_style = config.powerline_style or "||"
  if not config.show_devicons then
    config.powerline_style = "||"
  end
  LualineSettings.section_separators = get_section_separators(config.powerline_style)
  LualineSettings.component_separators = get_component_separators(config.powerline_style)
end

M.setup = function(config)
  -- Export module
  _G.LualineSettings = M

  -- Setup config
  config = H.setup_config(config)

  -- Apply config
  H.apply_config(config)
end

return M
