-- https://github.com/nvim-lua/telescope.nvim
local M = {}

M.sections = {
  lualine_a = {
    function()
      return "Telescope"
    end,
  },
  lualine_y = {
    function()
      local entry = require("telescope.actions.state").get_selected_entry()
      return entry and entry[1] or ""
    end,
  },
  lualine_z = {
    function()
      local picker = require("telescope.actions.state").get_current_picker(vim.api.nvim_get_current_buf())
      return picker and picker.prompt_title or ""
    end,
  },
}

M.filetypes = { "TelescopePrompt" }

return M
