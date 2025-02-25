-- https://github.com/echasnovski/mini.files
local M = {}

M.sections = {
  lualine_a = {
    function()
      return "MiniFiles"
    end,
  },
  lualine_b = {
    function()
      local ok, minifiles = pcall(require, "mini.files")
      if ok then
        local path = vim.fn.fnamemodify(minifiles.get_fs_entry().path, ":p:~:.")
        if path == "" then
          path = vim.fn.fnamemodify(minifiles.get_fs_entry().path, ":p:~")
        end
        return path
      else
        return ""
      end
    end,
  },
}

M.filetypes = { "minifiles" }

return M
