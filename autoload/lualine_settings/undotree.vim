" https://github.com/mbbill/undotree
function! lualine_settings#undotree#Status(...) abort
    if exists('t:undotree')
        return t:undotree.GetStatusLine()
    endif
    return ''
endfunction

function! lualine_settings#undotree#DiffStatus(...) abort
    if exists('t:diffpanel')
        retur t:diffpanel.GetStatusLine()
    endif
    return ''
endfunction
