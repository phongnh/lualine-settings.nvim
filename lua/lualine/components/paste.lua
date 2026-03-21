local function paste()
  if vim.o.paste then
    return LualineSettings.symbols.paste or "[P]"
  end
  return ""
end

return paste
