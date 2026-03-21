local function spell()
  if vim.o.spell then
    return string.upper((vim.o.spelllang or ""):gsub(",", "/"))
  end
  return ""
end

return spell
