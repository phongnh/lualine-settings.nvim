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

-- stylua: ignore start
local default_symbols = {
  dos       = "dos",
  mac       = "mac",
  unix      = "unix",
  tabs      = "TABS",
  space     = " ",
  bomb      = "🅑 ",
  noeol     = "∉ ",
  clipboard = "🅒 ",
  paste     = "🅟 ",
  readonly  = "",
  linenr    = "☰",
  branch    = "⎇ ",
  ellipsis  = "…",
  explorer  = "",
  folder    = "",
  search    = "",
}
-- stylua: ignore end

-- stylua: ignore start
local devicons_symbols = {
  dos       = "",
  mac       = "",
  unix      = "",
  tabs      = " ",
  space     = " ",
  bomb      = " ",
  noeol     = " ",
  clipboard = "🅒 ",
  paste     = "🅟 ",
  readonly  = "",
  linenr    = "",
  branch    = "",
  ellipsis  = "…",
  explorer  = "󰙅",
  folder    = "󰉋",
  search    = "󰈞",
}
-- stylua: ignore end

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
  vim.validate("config", config, "table", true)
  config = vim.tbl_deep_extend("force", vim.deepcopy(H.default_config), config or {})

  vim.validate("extensions", config.extensions, "table", true)
  vim.validate("show_devicons", config.show_devicons, "boolean")
  vim.validate("powerline_style", config.powerline_style, "string")
  vim.validate("symbols", config.symbols, "table", true)
  vim.validate("show_git_branch", config.show_git_branch, "boolean")
  vim.validate("show_linenr", config.show_linenr, "boolean")

  config.extensions = config.extensions
    or {
      "nrrwrgn",
      "mini-files",
      "snacks_explorer",
      "snacks_picker",
      "telescope",
      "fff",
      "fzf_lua",
      "neogit",
      "diffview",
      "gv",
      "fugitive2",
      "grepperside",
      "undotree",
      "tagbar",
      "outline",
      "lazy",
      "mason",
    }

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

H.setup_lualine = function()
  -- Disable lualine's require
  local lualine_require = require("lualine_require")
  lualine_require.require = require

  -- core extensions
  local extensions = {
    "cmdline",
    "qf",
    "help",
    "terminal",
    "filetype_mode",
    "netrw",
    "git",
    "gitcommit",
    "gitrebase",
    "diff",
    "man",
  }
  vim.list_extend(extensions, vim.deepcopy(LualineSettings.config.extensions))
  vim.list.unique(extensions)

  require("lualine").setup({
    options = {
      icons_enabled = LualineSettings.show_devicons,
      theme = "auto",
      component_separators = LualineSettings.component_separators,
      section_separators = LualineSettings.section_separators,
      globalstatus = vim.o.laststatus == 3,
      always_show_tabline = false,
      disabled_filetypes = { statusline = { "alpha", "dashboard", "ministarter" } },
    },
    sections = {
      lualine_a = {
        "mode",
        "clipboard",
        "paste",
        "spell",
      },
      lualine_b = LualineSettings.show_git_branch and { "branch" } or {},
      lualine_c = vim.list_extend(LualineSettings.show_devicons and {
        { "filetype", icon_only = true, separator = "", padding = { left = 1, right = 0 } },
      } or {}, {
        { "filename", path = 1, shorting_target = 40 },
      }),
      lualine_x = {
        "fileencoding",
        "bomb",
        "noeol",
        "fileformat2",
      },
      lualine_y = vim.list_extend(LualineSettings.show_linenr and {
        {
          "progress",
          cond = function()
            return vim.api.nvim_win_get_width(0) >= 100
          end,
          -- fmt = function(text, _context)
          --     return vim.api.nvim_win_get_width(0) >= 100 and text or ""
          -- end,
          separator = " ",
          padding = { left = 1, right = 0 },
        },
        {
          "location",
          cond = function()
            return vim.api.nvim_win_get_width(0) >= 100
          end,
          padding = { left = 0, right = 1 },
        },
      } or {}, { "indent" }),
      lualine_z = {
        { "filetype", icons_enabled = false },
      },
    },
    inactive_sections = {
      lualine_a = {},
      lualine_b = {},
      lualine_c = {
        { "filename", path = 3, shorting_target = 40 },
      },
      lualine_x = {},
      lualine_y = {},
      lualine_z = {},
    },
    extensions = extensions,
  })
end

M.setup = function(config)
  -- Export module
  _G.LualineSettings = M

  -- Setup config
  config = H.setup_config(config)

  -- Apply config
  H.apply_config(config)

  -- Setup lualine
  H.setup_lualine()
end

return M
