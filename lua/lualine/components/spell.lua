local spelllang_maps = {
  ["en_us"] = "US",
  ["en_gb"] = "GB",
}

local function spell()
  if vim.o.spell then
    return vim
      .iter(vim.split(vim.o.spelllang or "", ",", { plain = true, trimempty = true }))
      :map(function(val)
        return spelllang_maps[val] or string.upper(val)
      end)
      :join("/")
  end
  return ""
end

return spell
