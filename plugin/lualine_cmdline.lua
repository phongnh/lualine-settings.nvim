-- Command-line Window Integration
vim.api.nvim_create_autocmd("CmdwinEnter", {
  group = vim.api.nvim_create_augroup("LualineCmdline", { clear = true }),
  pattern = "*",
  callback = function()
    vim.o.filetype = "cmdline"
    vim.o.syntax = "vim"
  end,
})
