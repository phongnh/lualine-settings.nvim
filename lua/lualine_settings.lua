local M = {}

-- stylua: ignore start
M.section_separator_styles = {
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
M.component_separator_styles = {
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
  dos = "[dos]",
  mac = "[mac]",
  unix = "[unix]",
  tabs = "TABS",
  space = " ",
  bomb = "🅑 ",
  noeol = "∉ ",
  clipboard = "🅒 ",
  paste = "🅟 ",
  readonly = "",
  linenr = "☰",
  branch = "⎇ ",
}

local H = {}

H.default_config = {
  show_devicons = false,
  powerline_style = "||",
}

H.setup_config = function(config)
  vim.validate({ config = { config, "table", true } })
  config = vim.tbl_deep_extend("force", vim.deepcopy(H.default_config), config or {})

  vim.validate({
    show_devicons = { config.show_devicons, "boolean" },
    powerline_style = { config.powerline_style, "string" },
    symbols = { config.symbols, "table", true },
  })

  return config
end

H.apply_config = function(config)
  LualineSettings.config = config

  LualineSettings.symbols = vim.deepcopy(default_symbols)

  if config.show_devicons then
    LualineSettings.symbols = vim.tbl_extend("force", LualineSettings.symbols, {
      dos = "",
      mac = "",
      unix = "",
      tabs = " ",
      bomb = " ",
      noeol = " ",
      readonly = "",
      linenr = "",
      branch = "",
    })
  else
    config.powerline_style = "||"
  end

  LualineSettings.symbols = vim.tbl_deep_extend("force", LualineSettings.symbols, config.symbols or {})
  LualineSettings.section_separator = LualineSettings.get_section_separator(config.powerline_style)
  LualineSettings.component_separator = LualineSettings.get_component_separator(config.powerline_style)
end

M.get_section_separator = function(style)
  return LualineSettings.section_separator_styles[style] or LualineSettings.section_separator_styles["||"]
end

M.get_component_separator = function(style)
  return LualineSettings.component_separator_styles[style] or LualineSettings.component_separator_styles["||"]
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
