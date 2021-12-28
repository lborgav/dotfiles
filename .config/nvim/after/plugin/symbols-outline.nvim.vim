noremap <c-s> :SymbolsOutline<cr>

lua <<EOF
symbols_outline = require("symbols-outline")
symbols_outline.setup(
{
    position = 'right',
    width = 40,
})
EOF
