-- Integrate with vim-visual-multi plugin
vim.api.nvim_create_augroup("LualineSettingsVisualMulti", { clear = true })

vim.api.nvim_create_autocmd("User", {
  group = "LualineSettingsVisualMulti",
  pattern = "visual_multi_start",
  callback = function()
    require("lualine").hide({ place = { "statusline" } })
  end,
})

vim.api.nvim_create_autocmd("User", {
  group = "LualineSettingsVisualMulti",
  pattern = "visual_multi_exit",
  callback = function()
    require("lualine").hide({ place = { "statusline" }, unhide = true })
  end,
})
