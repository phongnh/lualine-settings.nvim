function! lualine_settings#Statusline(...) abort
    let focus = get(a:, 1, v:null)
    return v:lua.require("lualine").statusline(focus)
endfunction
