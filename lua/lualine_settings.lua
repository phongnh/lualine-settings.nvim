local M = {}

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
}

H.setup_config = function(config)
  vim.validate({ config = { config, "table", true } })
  config = vim.tbl_deep_extend("force", vim.deepcopy(H.default_config), config or {})

  vim.validate({
    show_devicons = { config.show_devicons, "boolean" },
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
  end

  LualineSettings.symbols = vim.tbl_deep_extend("force", LualineSettings.symbols, config.symbols or {})
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
