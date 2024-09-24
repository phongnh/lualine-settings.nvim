" https://github.com/preservim/tagbar
let g:lualine_tagbar = {}

function! lualine_settings#tagbar#Status(current, sort, fname, flags, ...) abort
    let g:lualine_tagbar.sort  = a:sort
    let g:lualine_tagbar.fname = a:fname
    let g:lualine_tagbar.flags = a:flags
    return lualine_settings#Statusline(a:current ? v:true : v:false)
endfunction
