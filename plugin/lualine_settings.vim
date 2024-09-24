if exists('g:loaded_lualine_settings') || !has('nvim')
    finish
endif

let g:loaded_lualine_settings = 1

" CtrlP Integration
if exists(':CtrlP') == 2
    let g:ctrlp_status_func = {
                \ 'main': 'lualine_settings#ctrlp#MainStatus',
                \ 'prog': 'lualine_settings#ctrlp#ProgressStatus',
                \ }
endif
