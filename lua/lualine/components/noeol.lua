local function noeol()
  if not vim.bo.eol then
    return LualineSettings.symbols.noeol or "[NOEOL]"
  end
  return ""
end

return noeol
