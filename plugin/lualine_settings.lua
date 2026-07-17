-- Command-line Window Integration
vim.api.nvim_create_autocmd("CmdwinEnter", {
  group = vim.api.nvim_create_augroup("LualineSettingsIntegrations", { clear = true }),
  pattern = "*",
  callback = function()
    vim.o.filetype = "cmdline"
    vim.o.syntax = "vim"
  end,
})

vim.api.nvim_create_autocmd("User", {
  group = "LualineSettingsIntegrations",
  pattern = "FugitiveChanged",
  callback = function()
    if not vim.g._fugitive_last_job then
      return
    end

    local bufnr = vim.g._fugitive_last_job.capture_bufnr or -1
    if bufnr > 0 then
      vim.b[bufnr].fugitive_git_command =
        vim.iter({ vim.g._fugitive_last_job.git, vim.g._fugitive_last_job.args }):flatten():join(" ")
    end
  end,
})
