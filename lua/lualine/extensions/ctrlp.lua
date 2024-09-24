-- https://github.com/ctrlpvim/ctrlp.vim
local M = {}

M.sections = {
  lualine_a = { "g:lualine_ctrlp.name" },
  lualine_b = {
    {
      "g:lualine_ctrlp.prev",
      cond = function()
        return vim.g.lualine_ctrlp.main
      end,
    },
    {
      "g:lualine_ctrlp.item",
      cond = function()
        return vim.g.lualine_ctrlp.main
      end,
      fmt = function(name, _context)
        return string.format("« %s »", name)
      end,
    },
    {
      "g:lualine_ctrlp.next",
      cond = function()
        return vim.g.lualine_ctrlp.main
      end,
    },
  },
  lualine_y = {
    {
      "g:lualine_ctrlp.focus",
      cond = function()
        return vim.g.lualine_ctrlp.main
      end,
    },
    {
      "g:lualine_ctrlp.byfname",
      cond = function()
        return vim.g.lualine_ctrlp.main
      end,
    },
    {
      "g:lualine_ctrlp.len",
      cond = function()
        return not vim.g.lualine_ctrlp.main
      end,
    },
  },
  lualine_z = { "g:lualine_ctrlp.dir" },
}

M.filetypes = { "ctrlp" }

return M
