vim.api.nvim_create_augroup("LualineSettingsIntegrations", { clear = true })

-- Command-line Window Integration
vim.api.nvim_create_autocmd("CmdwinEnter", {
  group = "LualineSettingsIntegrations",
  pattern = "*",
  callback = function()
    vim.o.filetype = "cmdline"
    vim.o.syntax = "vim"
  end,
})

vim.api.nvim_create_autocmd("VimEnter", {
  group = "LualineSettingsIntegrations",
  pattern = "*",
  callback = function()
    -- CtrlP Integration
    if vim.fn.exists(":CtrlP") == 2 then
      vim.g.ctrlp_status_func = {
        main = "lualine_settings#ctrlp#MainStatus",
        prog = "lualine_settings#ctrlp#ProgressStatus",
      }
    end

    -- CtrlSF Integration
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

    -- Tagbar Integration
    if vim.fn.exists(":Tagbar") == 2 then
      vim.g.tagbar_status_func = "lualine_settings#tagbar#Status"
    end
  end,
})

-- Integrate with vim-visual-multi plugin
vim.api.nvim_create_autocmd("User", {
  group = "LualineSettingsIntegrations",
  pattern = "visual_multi_start",
  callback = function()
    require("lualine").hide({ place = { "statusline" } })
  end,
})

vim.api.nvim_create_autocmd("User", {
  group = "LualineSettingsIntegrations",
  pattern = "visual_multi_exit",
  callback = function()
    require("lualine").hide({ place = { "statusline" }, unhide = true })
  end,
})
