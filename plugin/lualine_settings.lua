-- Disable lualine's require
local lualine_require = require("lualine_require")
lualine_require.require = require

require("lualine").setup({
  options = {
    icons_enabled = LualineSettings.show_devicons,
    theme = "auto",
    component_separators = LualineSettings.component_separators,
    section_separators = LualineSettings.section_separators,
    globalstatus = vim.o.laststatus == 3,
    always_show_tabline = false,
    disabled_filetypes = { statusline = { "startify", "alpha", "dashboard", "ministarter" } },
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
    lualine_x = { "fileencoding" },
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
  extensions = {
    "nrrwrgn",
    "bufexplorer",
    "cmdline",
    "netrw",
    "mini-files",
    "fugitive",
    "fugitiveblame",
    "gv",
    "git",
    "gitcommit",
    "gitrebase",
    "fzf",
    "undotree",
    "nvim-undotree",
    "diff",
    "tagbar",
    "outline",
    "mason",
    "lazy",
    "man",
    "qf",
    "help",
    "terminal",
  },
})
