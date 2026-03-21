local function clipboard()
  if string.find(vim.o.clipboard, "unnamed") ~= nil then
    return LualineSettings.symbols.clipboard or "[C]"
  end
  return ""
end

return clipboard
