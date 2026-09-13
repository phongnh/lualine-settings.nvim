-- Neovim builtin plugin: dir
local M = {}

M.sections = {
  lualine_a = {
    function()
      return "Dir"
    end,
  },
  lualine_c = {
    function()
      local cwd = vim.fn.fnamemodify(vim.fn.getcwd(-1, -1), ":p")
      local path = vim.fs.joinpath(vim.uv.cwd() or "", vim.api.nvim_get_current_line())
      return path:gsub("^" .. vim.pesc(cwd), "")
    end,
  },
}

M.filetypes = { "directory" }

return M
