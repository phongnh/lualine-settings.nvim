" https://github.com/ctrlpvim/ctrlp.vim
let g:lualine_ctrlp = { 'name': 'CtrlP' }

function! s:GetCurrentDir() abort
    let dir = fnamemodify(getcwd(), ':~:.')
    return empty(dir) ? getcwd() : dir
endfunction

function! lualine_settings#ctrlp#MainStatus(focus, byfname, regex, prev, item, next, marked) abort
    let g:lualine_ctrlp.main    = v:true
    let g:lualine_ctrlp.focus   = a:focus
    let g:lualine_ctrlp.byfname = a:byfname
    let g:lualine_ctrlp.regex   = a:regex
    let g:lualine_ctrlp.prev    = a:prev
    let g:lualine_ctrlp.item    = a:item
    let g:lualine_ctrlp.next    = a:next
    let g:lualine_ctrlp.marked  = a:marked
    let g:lualine_ctrlp.dir     = s:GetCurrentDir()
    return lualine_settings#Statusline(v:true)
endfunction

function! lualine_settings#ctrlp#ProgressStatus(len) abort
    let g:lualine_ctrlp.main = v:false
    let g:lualine_ctrlp.len  = a:len
    let g:lualine_ctrlp.dir  = s:GetCurrentDir()
    return lualine_settings#Statusline(v:true)
endfunction
