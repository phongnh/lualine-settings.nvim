local M = {}

local get_nrrw_rgn_status = function()
  return vim.fn.exists("*nrrwrgn#NrrwRgnStatus") == 1 and vim.fn["nrrwrgn#NrrwRgnStatus"]() or vim.empty_dict()
end

M.sections = {
  lualine_a = {
    function()
      local name = "NrrwRgn"

      if vim.fn.exists(":WR") == 2 or vim.fn.exists(":WidenRegion") == 2 then
        if vim.b.nrrw_instn ~= nil then
          name = string.format("%s#%d", "NrrwRgn", vim.b.nrrw_instn)
        else
          name = vim.fn.substitute(vim.api.nvim_buf_get_name(0), "^NrrwRgn_\\zs.*\\ze_d+$", submatch(0), "")
          name = vim.fn.substitute(name, "__", "#", "")
        end

        local dict = get_nrrw_rgn_status()
        if not vim.tbl_isempty(dict) then
          local vmode = { [""] = "", v = " [C]", V = "", [""] = " [B]" }
          name = (dict.multi == 1 and "Multi" or "") .. name .. vmode[dict.visual or "V"]
        end
      end

      return name
    end,
  },
  lualine_b = {
    {
      function()
        local dict = get_nrrw_rgn_status()
        if not vim.tbl_isempty(dict) then
          return vim.fn.fnamemodify(dict.fullname, ":~:.")
            .. (dict.multi == 1 and "" or string.format(" [%d-%d]", dict.start[2], dict["end"][2]))
        elseif vim.b.orig_buf ~= nil then
          return vim.fn.fnamemodify(vim.api.nvim_buf_get_name(vim.b.orig_buf), ":~:.")
        end
        return ""
      end,
      cond = function()
        return vim.fn.exists(":WR") == 2 or vim.fn.exists(":WidenRegion") == 2
      end,
    },
  },
  lualine_z = { "location" },
}

M.filetypes = { "NrrwRgn" }

return M
