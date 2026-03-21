local function basename()
  vim.fs.basename(vim.api.nvim_buf_get_name(0))
end

return basename
