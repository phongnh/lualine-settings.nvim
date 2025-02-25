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
        return vim.fn.fnamemodify(minifiles.get_fs_entry().path, ":p:~:.")
      else
        return ""
      end
    end,
  },
}

M.filetypes = { "minifiles" }

return M
