local M = {}

M.sections = {
  lualine_a = {
    function()
      return "GrepperSide"
    end,
  },
  lualine_b = {
    function()
      if not vim.tbl_isempty(vim.b.grepper_side_status) then
        return string.format(
          "Found %d %s in %d %s.",
          vim.b.grepper_side_status.matches,
          vim.b.grepper_side_status.matches == 1 and "match" or "matches",
          vim.b.grepper_side_status.files,
          vim.b.grepper_side_status.files == 1 and "file" or "files"
        )
      end
      return ""
    end,
  },
  lualine_y = { "position" },
}

M.filetypes = { "GrepperSide" }

return M
