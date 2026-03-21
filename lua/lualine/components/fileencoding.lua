local function fileencoding()
  local encoding = vim.bo.fileencoding ~= "" and vim.bo.fileencoding or vim.o.encoding
  if encoding == "utf-8" then
    return ""
  end
  return encoding
end

return fileencoding
