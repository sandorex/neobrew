" Title:        Neobrew
" Description:  Linuxbrew plugin for neovim.
" Maintainer:   Aleksandar Radivojevic <https://github.com/sandorex>

" prevent loading twice
if exists("g:loaded_neobrew")
    finish
endif

let g:loaded_neobrew = 1

" Delegate everything to lua
exe 'lua require("neobrew")'
