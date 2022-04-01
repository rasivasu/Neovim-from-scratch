vim.cmd [[
try
  colorscheme tokyonight
  let g:tokyonight_style="night"
  set background=dark
catch /^Vim\%((\a\+)\)\=:E185/
  colorscheme default
  set background=dark
endtry
]]
