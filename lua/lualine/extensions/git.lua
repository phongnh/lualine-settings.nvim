local M = {}

M.sections = {
  lualine_a = {
    function()
      return "Git"
    end,
  },
  lualine_c = {
    function()
      if vim.b.fugitive_git_command ~= nil then
        return vim.b.fugitive_git_command
      elseif
        vim.g._fugitive_last_job ~= nil and vim.g._fugitive_last_job.capture_bufnr == vim.api.nvim_get_current_buf()
      then
        local cmd = vim.iter({ vim.g._fugitive_last_job.git, vim.g._fugitive_last_job.args }):flatten():join(" ")
        vim.b.fugitive_git_command = cmd
        return cmd
      end
      return vim.fs.basename(vim.api.nvim_buf_get_name(0))
    end,
  },
  lualine_z = { "position" },
}

M.filetypes = { "git" }

return M
