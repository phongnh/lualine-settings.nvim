local M = {}

M.sections = {
  lualine_a = {
    function()
      return "Git"
    end,
  },
  lualine_c = {
    function()
      if
        vim.g._fugitive_last_job ~= nil
        and (
          vim.g._fugitive_last_job.file == vim.api.nvim_buf_get_name(0)
          or vim.g._fugitive_last_job.capture_bufnr == vim.api.nvim_get_current_buf()
        )
      then
        local cmd = vim.list_extend({}, vim.g._fugitive_last_job.git)
        cmd = vim.list_extend(cmd, vim.g._fugitive_last_job.args)
        return vim.iter(cmd):join(" ")
      end
      return vim.fs.basename(vim.api.nvim_buf_get_name(0))
    end,
  },
  lualine_z = { "position" },
}

M.filetypes = { "git" }

return M
