-- Use zathura as the PDF viewer
vim.g.vimtex_view_method = 'zathura_simple'

-- Use latexmk as the compiler and specify the build directory
vim.g.vimtex_compiler_method = 'latexmk'

-- Specify tex flavor, to ensure highlighting
vim.g.tex_falvor = 'latex'

-- Error suppression
--vim.g_vimtex_log_ignore = ({
--  'Underfull',
--  'Overfull',
--  'specifier changed to',
--  'Token not allowed in a PDF string',
--  })

vim.g.vimtex_compiler_latexmk = {
  options = {
    '-shell-escape',
    '-verbose',
    '-file-line-error',
    '-synctex=1',
  },
}

