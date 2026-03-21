local function bomb()
  if vim.bo.bomb then
    return LualineSettings.symbols.bomb or "[BOMB]"
  end
  return ""
end

return bomb
