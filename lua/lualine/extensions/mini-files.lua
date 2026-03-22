-- https://github.com/echasnovski/mini.files
local M = {}

M.sections = {
  lualine_a = {
    function()
      return "MiniFiles"
    end,
  },
  lualine_c = {
    function()
      local ok, minifiles = pcall(require, "mini.files")
      if ok then
        local current = minifiles.get_fs_entry().path
        local path = vim.fn.fnamemodify(current, ":p:~:.")
        if path == "" then
          path = vim.fn.fnamemodify(current, ":p:~")
        end
        return path
      end
      return ""
    end,
  },
}

M.filetypes = { "minifiles" }

return M
