local M = {}

M.sections = {
  lualine_a = {
    function()
      return "TERMINAL"
    end,
  },
  lualine_b = { "o:shell" },
  lualine_c = {
    function()
      if vim.b.term_title ~= nil then
        return vim.split(vim.b.term_title, ": ")[2] or vim.fn.cwd()
      else
        return vim.fn.cwd()
      end
    end,
  },
  lualine_y = { "b:terminal_job_pid" },
  lualine_z = { "location" },
}

M.filetypes = { "terminal" }

return M
