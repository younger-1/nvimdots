let g:indent_blankline_enabled = v:true
let g:indent_blankline_char = "│"
let g:indent_blankline_space_char = ' '
let g:indent_blankline_buftype_exclude = ['terminal']
let g:indent_blankline_show_current_context = v:true
lua << EOF
vim.g.indent_blankline_context_patterns = {
            "class", "function", "method", "block", "list_literal", "selector",
            "^if", "^table", "if_statement", "while", "for", "type", "var",
            "import"
        }
EOF
autocmd CursorMoved * IndentBlanklineRefresh
