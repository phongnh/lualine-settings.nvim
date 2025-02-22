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
        local path = minifiles.get_fs_entry().path
        if path == getcwd() then
          return vim.fn.fnamemodify(path, ":p:~")
        end
        return vim.fn.fnamemodify(path, ":p:~:.")
      else
        return ""
      end
    end,
  },
}

M.filetypes = { "minifiles" }

return M
