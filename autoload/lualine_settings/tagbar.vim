" https://github.com/preservim/tagbar
function! lualine_settings#tagbar#Status(current, sort, fname, flags, ...) abort
    let g:lualine_tagbar = { 'sort': a:sort, 'fname': a:fname, 'flags': a:flags }
    return ''
endfunction
