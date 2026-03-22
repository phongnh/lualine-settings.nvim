-- CtrlP Integration
vim.api.nvim_create_autocmd("VimEnter", {
  group = vim.api.nvim_create_augroup("LualineSettingsCtrlSF", { clear = true }),
  pattern = "*",
  callback = function()
    if vim.fn.exists(":CtrlSF") == 2 then
      vim.api.nvim_create_autocmd("BufEnter", {
        group = vim.api.nvim_create_augroup("LualineSettingsCtrlSFPreview", { clear = true }),
        pattern = "__CtrlSFPreview__",
        callback = function(evt)
          if string.find(vim.bo[evt.buf].filetype, "ctrlsf-preview") ~= nil then
            return
          end
          local filetype = vim.fn.fnamemodify(vim.b.ctrlsf_file, ":e")
          vim.bo[evt.buf].filetype = filetype .. ".ctrlsf-preview"
        end,
      })
    end
  end,
})
