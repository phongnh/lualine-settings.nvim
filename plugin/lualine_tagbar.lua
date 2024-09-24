-- Tagbar Integration
vim.api.nvim_create_autocmd("VimEnter", {
  group = vim.api.nvim_create_augroup("LualineTagbar", { clear = true }),
  pattern = "*",
  callback = function()
    if vim.fn.exists(":Tagbar") == 2 then
      vim.g.tagbar_status_func = "lualine_settings#tagbar#Status"
    end
  end,
})
