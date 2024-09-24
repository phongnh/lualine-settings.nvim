-- CtrlP Integration
vim.api.nvim_create_autocmd("VimEnter", {
  group = vim.api.nvim_create_augroup("LualineCtrlP", { clear = true }),
  pattern = "*",
  callback = function()
    if vim.fn.exists(":CtrlP") == 2 then
      vim.g.ctrlp_status_func = {
        main = "lualine_settings#ctrlp#MainStatus",
        prog = "lualine_settings#ctrlp#ProgressStatus",
      }
    end
  end,
})
