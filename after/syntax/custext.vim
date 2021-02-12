if exists("b:current_syntax")
    finish
endif

echom "Our syntax highlighting code will go here."

let b:current_syntax = "custext"

syntax match cusQ "\vQ:.*$"
highlight link cusQ Keyword
