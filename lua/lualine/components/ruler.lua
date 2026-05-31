local function progress()
  if vim.fn.line("w0") == 1 then
    return vim.fn.line("w$") == vim.fn.line("$") and "All" or "Top"
  elseif vim.fn.line("w$") == vim.fn.line("$") then
    return "Bot"
  else
    return string.format("%2d%%%%", math.floor(vim.fn.line(".") / vim.fn.line("$") * 100))
  end
end

local function ruler()
  return string.format("%4d:%-3d %3s", vim.fn.line("."), vim.fn.charcol("."), progress())
end

return ruler
