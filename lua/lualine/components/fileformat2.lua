local function fileformat2()
  local format = vim.bo.fileformat
  if format == "unix" then
    return ""
  end
  return LualineSettings.symbols[format] or format
end

return fileformat2
