@default_files = ('main.tex');

# Always create PDFs and set default engine to LuaLaTeX.
$pdf_mode = 4;

# Set the lualatex variable.
$lualatex      = 'lualatex --file-line-error %O %S';
$pdf_previewer = 'open %O %S';

$aux_dir = '.aux';
$out_dir = 'out';
