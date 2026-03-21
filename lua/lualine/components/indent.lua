local function indent() abort
  local is_compact = vim.api.nvim_win_get_width(0) < 100
  if vim.bo.expandtab then
    local shiftwidth = vim.fn.exists("*shiftwidth") == 1 and vim.fn.shiftwidth() or vim.bo.shiftwidth
    return string.format(is_compact and "SPC: %d" or "Spaces: %d", shiftwidth)
  else
    return string.format(is_compact and "TAB: %d" or "Tab Size: %d", vim.bo.tabstop)
  end
end

return indent
